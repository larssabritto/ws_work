import 'package:flutter/material.dart';
import 'package:ws_work/app/core/ui/theme/theme.dart';

import 'colors.dart';

abstract class LightTheme implements AppTheme {
  static final ThemeData instance = ThemeData(fontFamily: 'Quicksand');

  static of(BuildContext context) => instance.copyWith(
        cardTheme: CardTheme.of(context).copyWith(color: Colors.white),
        dialogTheme: DialogTheme.of(context).copyWith(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        appBarTheme: instance.appBarTheme.copyWith(
            iconTheme: IconThemeData(color: Colors.black, shadows: [
              Shadow(
                  color: Colors.black.withAlpha(80),
                  blurRadius: 6,
                  offset: const Offset(3, 3))
            ]),
            backgroundColor: secondary,
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
            centerTitle: true),
        inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.all(17),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26))),
        primaryColor: secondary,
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        colorScheme: ColorScheme.fromSeed(
            seedColor: primary,
            primary: primary,
            error: danger,
            brightness: Brightness.light),
      );
}
