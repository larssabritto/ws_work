import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ws_work/app/core/ui/widgets/border/decorated_input_border.dart';

class InputTextWidget<T> extends StatefulWidget {
  final String label;
  final String? hintText;
  final String formControlName;
  final Map<String, String Function(Object)>? validationMessages;
  final Function(FormControl<dynamic>)? onTap;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool? isDarker;
  final bool? autofocus;
  final bool readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? labelAlignLabelWithHint;
  final double? labelFontSize;
  final int maxLines;
  final EdgeInsets? contentPadding;

  /// Show clear button when the input is not empty
  /// this property overrides the [suffixIcon].
  final bool showClearButton;

  /// Show a toggle button, to obscure or not the text
  /// this property overrides the [suffixIcon] and shouldn't
  /// be used with [showClearButton]
  final bool isPassword;

  final List<TextInputFormatter>? mask;

  const InputTextWidget(
      {Key? key,
      required this.label,
      required this.formControlName,
      this.validationMessages,
      this.isDarker,
      this.maxLength,
      this.prefixIcon,
      this.suffixIcon,
      this.autofocus,
      this.isPassword = false,
      this.mask,
      this.keyboardType,
      this.readOnly = false,
      this.onTap,
      this.showClearButton = false,
      this.labelAlignLabelWithHint,
      this.hintText,
      this.maxLines = 1,
      this.labelFontSize,
      this.contentPadding})
      : super(key: key);

  @override
  State<InputTextWidget<T>> createState() => _InputTextWidgetState<T>();
}

class _InputTextWidgetState<T> extends State<InputTextWidget<T>> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder<T>(
        formControlName: widget.formControlName,
        builder: (_, control, ___) {
          return ReactiveTextField<T>(
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.mask,
            obscureText: isObscure,
            decoration: InputDecoration(
                contentPadding:
                    widget.contentPadding ?? const EdgeInsets.only(left: 15),
                filled: true,
                fillColor: Colors.white,
                hintText: widget.hintText,
                border: _getBorder(),
                enabledBorder: _getBorder(),
                focusedBorder: _getBorder(2),
                prefixIcon: widget.prefixIcon,
                suffixIcon: _getSuffixIcon(control),
                label: Text(
                  widget.label,
                  style: TextStyle(
                      color: _chooseColor(
                          dark: Colors.white, white: Colors.black45),
                      fontSize: widget.labelFontSize),
                ),
                alignLabelWithHint: widget.labelAlignLabelWithHint),
            style: TextStyle(
                color: _chooseColor(dark: Colors.white, white: Colors.black)),
            formControlName: widget.formControlName,
            validationMessages: widget.validationMessages,
            autofocus: widget.autofocus ?? false,
          );
        });
  }

  InputBorder _getBorder([double borderSideWidth = 1]) {
    return DecoratedInputBorder(
      child: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
              color: _chooseColor(dark: Colors.white, white: Colors.black38),
              width: borderSideWidth)),
      shadow: BoxShadow(
          color: Colors.black.withAlpha(40),
          blurRadius: 2,
          offset: const Offset(0, 3)),
    );
  }

  Color _chooseColor({required Color white, required Color dark}) {
    return widget.isDarker != null && widget.isDarker != false ? dark : white;
  }

  Widget _clearButton(VoidCallback? onPressed) {
    return IconButton(
      icon: Icon(Icons.clear, shadows: [
        Shadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 10,
            offset: const Offset(0, 3))
      ]),
      onPressed: onPressed,
    );
  }

  Widget _passwordToggle() {
    return IconButton(
        onPressed: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off));
  }

  Widget? _getSuffixIcon(control) {
    if (widget.isPassword) {
      return _passwordToggle();
    } else if (widget.showClearButton &&
        control.value != null &&
        control.value.toString().isNotEmpty) {
      return _clearButton(() {
        control.updateValue(null);
      });
    } else {
      return widget.suffixIcon;
    }
  }
}
