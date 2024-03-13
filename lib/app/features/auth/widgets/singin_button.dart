import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ws_work/app/core/ui/widgets/button/raisedbutton_widget.dart';
import 'package:ws_work/app/store/car.store.dart';

class SingInButton extends StatefulWidget {
  const SingInButton({Key? key, required this.state}) : super(key: key);

  final CarStore state;

  @override
  State<SingInButton> createState() => _SingInButtonState();
}

class _SingInButtonState extends State<SingInButton> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(builder: (_, __, ___) {
      return RaisedButtonWidget(
        label: "Entrar",
        onPressed: () async {
          if (widget.state.formGroup.valid) {
            await widget.state.authenticate();
            if (widget.state.valid) {
              Modular.to.navigate('/home');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Verifique usuário e senha!'),
              ));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text('Por favor, preencha todos os campos corretamente.'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
      );
    });
  }
}
