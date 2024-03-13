import 'package:flutter/material.dart';
import 'package:ws_work/app/core/ui/theme/theme.dart';

import 'colors.dart';

class DarkTheme implements AppTheme {
  static final ThemeData theme = ThemeData(fontFamily: 'Quicksand');
  static ThemeData of(BuildContext context) {
    return theme.copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: primary,
        appBarTheme: theme.appBarTheme.copyWith(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: primary,
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
            centerTitle: true),
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
            enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: secondary, width: 2),
        )),
        colorScheme: theme.colorScheme.copyWith(
            brightness: Brightness.dark,
            primary: Colors.white,
            secondary: secondary,
            error: danger,
            outline: Colors.white10));
  }

  bool isDark() {
    return false;
  }
}
