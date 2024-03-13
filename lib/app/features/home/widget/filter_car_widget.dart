import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work/app/store/car.store.dart';

class FilterCarWidget extends StatelessWidget {
  const FilterCarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CarStore state = Modular.get<CarStore>();

    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            controller: state.searchController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelText: 'Pesquisar carros',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              state.filterCars(value);
            },
          ),
        ],
      ),
    );
  }
}
