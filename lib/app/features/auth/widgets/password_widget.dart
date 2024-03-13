import 'package:flutter/material.dart';
import 'package:ws_work/app/core/ui/theme/colors.dart';
import 'package:ws_work/app/core/ui/widgets/input/input_tex_widget.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const InputTextWidget(

      label: "Senha",
      formControlName: "nm_senha",
      prefixIcon: Icon(
        Icons.remove_red_eye,
        color: primary,
      ),
    );
  }
}
