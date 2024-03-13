// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarStore on CarStoreBase, Store {
  Computed<dynamic>? _$valueComputed;

  @override
  dynamic get value => (_$valueComputed ??=
          Computed<dynamic>(() => super.value, name: 'CarStoreBase.value'))
      .value;

  late final _$loggedInUserAtom =
      Atom(name: 'CarStoreBase.loggedInUser', context: context);

  @override
  String get loggedInUser {
    _$loggedInUserAtom.reportRead();
    return super.loggedInUser;
  }

  @override
  set loggedInUser(String value) {
    _$loggedInUserAtom.reportWrite(value, super.loggedInUser, () {
      super.loggedInUser = value;
    });
  }

  late final _$selectedCarAtom =
      Atom(name: 'CarStoreBase.selectedCar', context: context);

  @override
  Carro? get selectedCar {
    _$selectedCarAtom.reportRead();
    return super.selectedCar;
  }

  @override
  set selectedCar(Carro? value) {
    _$selectedCarAtom.reportWrite(value, super.selectedCar, () {
      super.selectedCar = value;
    });
  }

  late final _$originalCarsAtom =
      Atom(name: 'CarStoreBase.originalCars', context: context);

  @override
  ObservableList<Carro> get originalCars {
    _$originalCarsAtom.reportRead();
    return super.originalCars;
  }

  @override
  set originalCars(ObservableList<Carro> value) {
    _$originalCarsAtom.reportWrite(value, super.originalCars, () {
      super.originalCars = value;
    });
  }

  late final _$filteredCarsAtom =
      Atom(name: 'CarStoreBase.filteredCars', context: context);

  @override
  ObservableList<Carro> get filteredCars {
    _$filteredCarsAtom.reportRead();
    return super.filteredCars;
  }

  @override
  set filteredCars(ObservableList<Carro> value) {
    _$filteredCarsAtom.reportWrite(value, super.filteredCars, () {
      super.filteredCars = value;
    });
  }

  late final _$searchControllerAtom =
      Atom(name: 'CarStoreBase.searchController', context: context);

  @override
  TextEditingController? get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController? value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'CarStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$validAtom = Atom(name: 'CarStoreBase.valid', context: context);

  @override
  bool get valid {
    _$validAtom.reportRead();
    return super.valid;
  }

  @override
  set valid(bool value) {
    _$validAtom.reportWrite(value, super.valid, () {
      super.valid = value;
    });
  }

  late final _$formGroupAtom =
      Atom(name: 'CarStoreBase.formGroup', context: context);

  @override
  FormGroup get formGroup {
    _$formGroupAtom.reportRead();
    return super.formGroup;
  }

  @override
  set formGroup(FormGroup value) {
    _$formGroupAtom.reportWrite(value, super.formGroup, () {
      super.formGroup = value;
    });
  }

  late final _$loadCarsAsyncAction =
      AsyncAction('CarStoreBase.loadCars', context: context);

  @override
  Future<void> loadCars() {
    return _$loadCarsAsyncAction.run(() => super.loadCars());
  }

  late final _$saveLeadAsyncAction =
      AsyncAction('CarStoreBase.saveLead', context: context);

  @override
  Future<void> saveLead(Carro car, String userContactInfo) {
    return _$saveLeadAsyncAction
        .run(() => super.saveLead(car, userContactInfo));
  }

  late final _$sendLeadsToServerAsyncAction =
      AsyncAction('CarStoreBase.sendLeadsToServer', context: context);

  @override
  Future<void> sendLeadsToServer() {
    return _$sendLeadsToServerAsyncAction.run(() => super.sendLeadsToServer());
  }

  late final _$authenticateAsyncAction =
      AsyncAction('CarStoreBase.authenticate', context: context);

  @override
  Future<void> authenticate() {
    return _$authenticateAsyncAction.run(() => super.authenticate());
  }

  late final _$handleEuQueroPressAsyncAction =
      AsyncAction('CarStoreBase.handleEuQueroPress', context: context);

  @override
  Future<void> handleEuQueroPress(BuildContext context, Carro car) {
    return _$handleEuQueroPressAsyncAction
        .run(() => super.handleEuQueroPress(context, car));
  }

  late final _$CarStoreBaseActionController =
      ActionController(name: 'CarStoreBase', context: context);

  @override
  void filterCars(String query) {
    final _$actionInfo = _$CarStoreBaseActionController.startAction(
        name: 'CarStoreBase.filterCars');
    try {
      return super.filterCars(query);
    } finally {
      _$CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCar(Carro car) {
    final _$actionInfo = _$CarStoreBaseActionController.startAction(
        name: 'CarStoreBase.setSelectedCar');
    try {
      return super.setSelectedCar(car);
    } finally {
      _$CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCar(Carro car) {
    final _$actionInfo = _$CarStoreBaseActionController.startAction(
        name: 'CarStoreBase.selectCar');
    try {
      return super.selectCar(car);
    } finally {
      _$CarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loggedInUser: ${loggedInUser},
selectedCar: ${selectedCar},
originalCars: ${originalCars},
filteredCars: ${filteredCars},
searchController: ${searchController},
loading: ${loading},
valid: ${valid},
formGroup: ${formGroup},
value: ${value}
    ''';
  }
}
