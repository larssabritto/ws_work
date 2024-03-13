import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ws_work/app/core/ui/theme/colors.dart';

class DropdownWidget<T> extends StatefulWidget {
  final String label;
  final String formControlName;
  final Map<String, String Function(Object)>? validationMessages;
  final Icon? prefixIcon;
  final bool? isDarker;
  final Function(T) valueProperty;
  final List<T> options;
  final bool readOnly;
  final void Function(FormControl<Object>)? onChange;

  final void Function(FocusNode)? onFocusChange;

  const DropdownWidget(
      {Key? key,
      required this.formControlName,
      required this.options,
      required this.valueProperty,
      this.label = '',
      this.validationMessages,
      this.isDarker,
      this.prefixIcon,
      this.readOnly = false,
      this.onFocusChange,
      this.onChange})
      : super(key: key);

  @override
  State<DropdownWidget<T>> createState() => _DropDownWidgetWidgetState<T>();
}

class _DropDownWidgetWidgetState<T> extends State<DropdownWidget<T>> {
  FocusNode inputFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    if (widget.onFocusChange != null) {
      inputFocusNode.addListener(() {
        widget.onFocusChange!(inputFocusNode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownField(
      isExpanded: true,
      isDense: false,
      formControlName: widget.formControlName,
      icon: widget.prefixIcon,
      items: widget.options
          .map((entity) => DropdownMenuItem(
              value: widget.valueProperty(entity),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
              )))
          .toList(),
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: _getBorderColor())),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _getBorderColor())),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _getLabelColorFocus(), width: 2)),
        labelText: widget.label,
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        labelStyle: TextStyle(color: _getLabelColor()),
      ),
      style: TextStyle(color: _getTextColor()),
      validationMessages: widget.validationMessages,
      onChanged: widget.onChange,
    );
  }

  Color _getBorderColor() {
    return widget.isDarker != null && widget.isDarker != false
        ? Colors.white
        : Colors.black38;
  }

  Color _getLabelColor() {
    return widget.isDarker != null && widget.isDarker != false
        ? Colors.white
        : Colors.black45;
  }

  Color _getTextColor() {
    return widget.isDarker != null && widget.isDarker != false
        ? Colors.white
        : textBlack;
  }

  Color _getLabelColorFocus() {
    return widget.isDarker != null && widget.isDarker != false
        ? Colors.white
        : textBlack;
  }

  @override
  void dispose() {
    inputFocusNode.dispose();
    super.dispose();
  }
}
