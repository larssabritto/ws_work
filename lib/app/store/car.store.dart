import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as path;
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ws_work/app/model%20/entity/car.dart';
import 'package:ws_work/app/service/auth_service.dart';

part 'car.store.g.dart';

class CarStore = CarStoreBase with _$CarStore;

abstract class CarStoreBase with Store {
  final AuthService authService;

  @observable
  String loggedInUser = "";

  String? userName;

  @observable
  Carro? selectedCar;

  @observable
  ObservableList<Carro> originalCars = ObservableList<Carro>.of([]);

  @observable
  ObservableList<Carro> filteredCars = ObservableList<Carro>.of([]);

  @observable
  TextEditingController? searchController;

  @observable
  bool loading = true;

  @observable
  bool valid = false;

  @observable
  var formGroup = FormGroup({
    'nm_cpf': FormControl<String>(validators: [Validators.required]),
    'nm_senha': FormControl<String>(validators: [Validators.required]),
  });

  @computed
  get value => formGroup.value;

  CarStoreBase(this.authService) {
    originalCars = ObservableList<Carro>();
    filteredCars = ObservableList<Carro>();
    searchController = TextEditingController();
    loadCars();
  }

  @action
  Future<void> loadCars() async {
    final response =
        await http.get(Uri.parse('https://wswork.com.br/cars.json'));
    if (response.statusCode == 200) {
      List<Carro> loadedCars = _parseCars(response.body);
      originalCars = ObservableList<Carro>.of(loadedCars);
      // Atualiza os carros filtrados ao carregar os carros
      filterCars('');
    } else {
      throw Exception('Falha ao carregar os dados do JSON');
    }
  }

  @action
  void filterCars(String query) {
    if (originalCars.isNotEmpty) {
      if (query.isNotEmpty) {
        filteredCars = ObservableList<Carro>.of(originalCars.where((car) {
          return car.nomeModelo.toLowerCase().contains(query.toLowerCase());
        }).toList());
      } else {
        // Se a consulta estiver vazia, restaurar todos os carros
        filteredCars = ObservableList<Carro>.of(originalCars);
      }
    }
  }

  @action
  Future<void> saveLead(Carro car, String userContactInfo) async {
    final database = await openDatabase(
      path.join(await getDatabasesPath(), 'db.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE leads(id INTEGER PRIMARY KEY, carName TEXT, userContactInfo TEXT)',
        );
      },
      version: 1,
    );

    await database.insert(
      'leads',
      {'carName': car.nomeModelo, 'userContactInfo': loggedInUser},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @action
  Future<void> sendLeadsToServer() async {
    final database = await openDatabase(
      path.join(await getDatabasesPath(), 'db.db'),
      version: 1,
    );

    final List<Map<String, dynamic>> leads = await database.query('leads');

    for (final lead in leads) {
      await http.post(
        Uri.parse('https://www.wswork.com.br/cars/leads'),
        body: jsonEncode(lead),
        headers: {'Content-Type': 'application/json'},
      );
    }
  }

  @action
  void setSelectedCar(Carro car) {
    selectedCar = car;
  }

  @action
  void selectCar(Carro car) {
    selectedCar = car;
  }

  @action
  Future<void> authenticate() async {
    loading = true;

    final cpfControl = formGroup.control('nm_cpf');
    final senhaControl = formGroup.control('nm_senha');

    if (cpfControl.valid && senhaControl.valid) {
      try {
        final cpf = cpfControl.value as String;
        final senha = senhaControl.value as String;

        final user = await authService.authenticate(cpf, senha);
        valid = user != null && authService.isUserInList(user['nome']);
        if (user != null && valid) {
          loggedInUser = user['nome'];
        }
      } catch (e) {
        print('Erro de autenticação: $e');
        valid = false;
      }
    } else {
      print('CPF e/ou senha inválidos');
      valid = false;
    }

    loading = false;
  }

  @action
  Future<void> handleEuQueroPress(
    BuildContext context,
    Carro car,
  ) async {
    try {
      if (loggedInUser != null) {
        getLoggedInUser(loggedInUser);
        // Salvar o lead no banco de dados interno
        await saveLead(car, loggedInUser);
        // Exibir uma mensagem de sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Compra registrada com sucesso!'),
          ),
        );
      } else {
        // Lógica para lidar com user sendo nulo
      }
    } catch (e) {
      // Lidar com qualquer exceção que possa ocorrer ao salvar o lead
      print('Erro ao salvar lead: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Erro ao registrar a compra. Por favor, tente novamente.'),
        ),
      );
    }
  }

  @action
  Future<List<Map<String, Object?>>> fetchLeads() async {
    final database = await openDatabase(
      path.join(await getDatabasesPath(), 'db.db'),
      version: 1,
    );
    List<Map<String, Object?>> leadsMap = await database.query('leads');
    return leadsMap;
  }

  String? getLoggedInUser(user) {
    return userName;
  }

  List<Carro> _parseCars(String jsonString) {
    final parsed = jsonDecode(jsonString);
    final List<dynamic> carsJson = parsed['cars'];
    return carsJson.map((json) => Carro.fromJson(json)).toList();
  }
}
