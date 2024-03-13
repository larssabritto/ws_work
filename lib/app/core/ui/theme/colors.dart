import 'package:flutter/material.dart';

const Color primary = Color.fromARGB(255, 8, 6, 40);
const Color secondary = Color.fromARGB(255, 240, 189, 3);
const Color warn = Color.fromARGB(255, 255, 160, 28);
const Color danger = Color.fromARGB(255, 235, 51, 54);
const Color white = Color.fromARGB(255, 255, 255, 255);
const Color textBlack = Color.fromARGB(255, 0, 0, 0);
const Color textgrey = Color.fromARGB(147, 0, 0, 0);

getColor(String color, {int? alpha}) {
  alpha = alpha != null ? _getColorFromPercent(alpha) : 255;
  switch (color) {
    case 'primary':
      return primary.withAlpha(alpha);
    case 'secondary':
      return secondary.withAlpha(alpha);
    case 'warn':
      return warn.withAlpha(alpha);
    case 'danger':
      return danger.withAlpha(alpha);
    case 'default':
      return Colors.black26;
    default:
  }
}

int _getColorFromPercent(int alpha) {
  return ((255 * alpha) / 100).round();
}
