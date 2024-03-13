import 'package:flutter/material.dart';
import 'package:ws_work/app/core/ui/theme/colors.dart';

enum ButtonExpand { normal, fit }

class FlatButtonWidget extends StatelessWidget {
  final String label;
  final String? color;
  final ButtonExpand? expand;
  final Function? onPressed;
  final IconData? icon;

  const FlatButtonWidget(
      {super.key,
      required this.label,
      this.icon,
      this.color,
      this.expand,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: UniqueKey(),
      onPressed: onPressed != null ? () => onPressed!() : null,
      style: ElevatedButton.styleFrom(
          elevation: 5,
          minimumSize: const Size(98, 48),
          backgroundColor: color != null ? getColor(color!) : primary,
          disabledForegroundColor: Colors.grey.withOpacity(0.28),
          disabledBackgroundColor: Colors.grey.withOpacity(0.12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(width: 1, color: white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 25),
          icon != null
              ? Container(
                  margin: const EdgeInsets.only(left: 8.0),
                )
              : Container(),
          Center(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, color: white),
              softWrap: false,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
