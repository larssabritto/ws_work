import 'package:flutter/material.dart';
import 'package:ws_work/app/core/ui/theme/colors.dart';

class CardWidget extends StatefulWidget {
  final String label;
  final String subLabel;
  final String color;
  final bool disabled;
  final bool checked;
  final Function()? onTap;

  const CardWidget(
      {Key? key,
      this.label = '',
      this.subLabel = '',
      this.color = '',
      this.disabled = false,
      this.checked = true,
      this.onTap})
      : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isChecked = true;

  @override
  void initState() {
    super.initState();
    isChecked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      alignment: Alignment.center,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: getColor(widget.color),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                  isChecked ? Icons.check_box_outline_blank : Icons.check_box,
                  size: 35,
                  color: Colors.black87),
              title: Text(widget.label, style: const TextStyle(fontSize: 18.0)),
              subtitle:
                  Text(widget.subLabel, style: const TextStyle(fontSize: 15.0)),
              enabled: !widget.disabled,
              onTap: () => {
                widget.onTap != null
                    ? (widget.onTap!())
                    : setState(() {
                        isChecked = !isChecked;
                      })
              },
              trailing: const Icon(Icons.remove_red_eye_outlined,
                  size: 20, color: Colors.black87),
            )
          ],
        ),
      ),
    ));
  }
}
