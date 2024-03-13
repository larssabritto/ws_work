import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_work/app/core/ui/theme/colors.dart';
import 'package:ws_work/app/core/ui/widgets/button/flat_button_widget.dart';
import 'package:ws_work/app/features/home/widget/car_list_widget.dart';
import 'package:ws_work/app/features/home/widget/filter_car_widget.dart';
import 'package:ws_work/app/store/car.store.dart';

class HomeView extends StatefulWidget {
  final CarStore state;
  const HomeView({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? selectedCarName;
  late String user;

  @override
  void initState() {
    super.initState();
    user = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: GestureDetector(
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            ),
            onPressed: () {
              Modular.to.navigate('/auth');
            },
          ),
        ),
        backgroundColor: primary,
        centerTitle: true,
        title: const Text(
          "Ws-Work",
          style: TextStyle(
            color: white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FilterCarWidget(),
            const SizedBox(height: 10),
            CarListWidget(
              state: widget.state,
              onCarSelected: (carName) {},
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(builder: (context) {
                final selectedCar = widget.state.selectedCar;
                return FlatButtonWidget(
                  onPressed: widget.state.selectedCar != null
                      ? () =>
                          widget.state.handleEuQueroPress(context, selectedCar!)
                      : null,
                  label: "EU QUERO",
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
