import 'package:flutter/material.dart';

import 'ligth.theme.dart';


class ThemePreferences {
  static final ValueNotifier<ThemeData?> _theme =
  ValueNotifier<ThemeData?>(null);
  static ValueNotifier<ThemeData?> get theme => _theme;

  ThemePreferences();

  static ThemeData? of(BuildContext context) {
    _theme.value = LightTheme.of(context);
    return _theme.value;
  }
}
