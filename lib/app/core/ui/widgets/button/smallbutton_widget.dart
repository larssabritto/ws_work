import 'package:flutter/material.dart';
import 'package:ws_work/app/core/ui/theme/colors.dart';

class SmallButtonWidget extends StatelessWidget {
  final String label;
  final String color;
  final bool disabled;
  final IconData? icon;
  final Function()? onPressed;

  const SmallButtonWidget(
      {Key? key,
      this.label = '',
      this.color = 'primary',
      this.disabled = false,
      this.icon,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: getColor(color),
          alignment: Alignment.center,
          minimumSize: const Size(78, 26),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          side: BorderSide(
            color: getColor(color),
            width: 1,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                  child: Text(
                label,
                softWrap: false,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              )),
              icon != null
                  ? Container(
                      margin: const EdgeInsets.only(left: 5.0),
                      child: Icon(icon, size: 16.0))
                  : Container(),
            ]));
  }
}
