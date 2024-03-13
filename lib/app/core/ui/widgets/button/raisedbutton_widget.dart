import 'package:flutter/material.dart';
import 'package:ws_work/app/core/ui/theme/colors.dart';

class RaisedButtonWidget extends StatelessWidget {
  final String label;
  final String color;
  final bool disabled;
  final IconData? icon;
  final Function()? onPressed;

  const RaisedButtonWidget(
      {Key? key,
      this.label = '',
      this.color = 'primary',
      this.disabled = false,
      this.onPressed,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed!();
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primary,
        alignment: Alignment.centerRight,
        disabledForegroundColor: Colors.white.withOpacity(0.38),
        disabledBackgroundColor: Colors.white.withOpacity(0.12),
        minimumSize: const Size(100, 50),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
