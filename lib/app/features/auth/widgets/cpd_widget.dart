import 'package:flutter/material.dart';
import 'package:ws_work/app/core/ui/theme/colors.dart';
import 'package:ws_work/app/core/ui/widgets/input/input_tex_widget.dart';

class CpfWidget extends StatelessWidget {
  const CpfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const InputTextWidget(
      label: "CPF",
      formControlName: "nm_cpf",
      prefixIcon: Icon(
        Icons.person,
        color: primary,
      ),
    );
  }
}
