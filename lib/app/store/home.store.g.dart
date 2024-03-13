// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$carsAtom = Atom(name: 'HomeStoreBase.cars', context: context);

  @override
  ObservableList<Carro> get cars {
    _$carsAtom.reportRead();
    return super.cars;
  }

  @override
  set cars(ObservableList<Carro> value) {
    _$carsAtom.reportWrite(value, super.cars, () {
      super.cars = value;
    });
  }

  late final _$filteredCarsAtom =
      Atom(name: 'HomeStoreBase.filteredCars', context: context);

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

  late final _$loadCarsAsyncAction =
      AsyncAction('HomeStoreBase.loadCars', context: context);

  @override
  Future<void> loadCars() {
    return _$loadCarsAsyncAction.run(() => super.loadCars());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void filterCars(String query) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.filterCars');
    try {
      return super.filterCars(query);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cars: ${cars},
filteredCars: ${filteredCars}
    ''';
  }
}
