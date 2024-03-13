import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:ws_work/app/model%20/entity/car.dart';

part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<Carro> cars = ObservableList<Carro>();

  @observable
  ObservableList<Carro> filteredCars = ObservableList<Carro>();

  @action
  Future<void> loadCars() async {
    final response =
        await http.get(Uri.parse('https://wswork.com.br/cars.json'));
    if (response.statusCode == 200) {
      List<Carro> loadedCars = _parseCars(response.body);
      cars.clear();
      cars.addAll(loadedCars);
      filterCars('');
    } else {
      throw Exception('Falha ao carregar os dados do JSON');
    }
  }

  @action
  void filterCars(String query) {
    filteredCars.clear();
    filteredCars.addAll(cars.where((carro) {
      return carro.nomeModelo.toLowerCase().contains(query.toLowerCase());
    }));
  }

  List<Carro> _parseCars(String jsonString) {
    final parsed = jsonDecode(jsonString);
    final List<dynamic> carsJson = parsed['cars'];
    return carsJson.map((json) => Carro.fromJson(json)).toList();
  }
}
