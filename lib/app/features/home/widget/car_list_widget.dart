import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ws_work/app/store/car.store.dart';

class CarListWidget extends StatefulWidget {
  final CarStore state;
  final Null Function(dynamic carName) onCarSelected;

  const CarListWidget(
      {Key? key, required this.onCarSelected, required this.state})
      : super(key: key);

  @override
  State<CarListWidget> createState() => _CarListWidgetState();
}

class _CarListWidgetState extends State<CarListWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.state.filteredCars.length,
              itemBuilder: (context, index) {
                final carro = widget.state.filteredCars[index];
                return GestureDetector(
                  onTap: () {
                    widget.state.selectCar(carro);
                    widget.onCarSelected(carro.nomeModelo);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(carro.nomeModelo),
                      subtitle: Text('ID: ${carro.id}'),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      );
    });
  }
}
