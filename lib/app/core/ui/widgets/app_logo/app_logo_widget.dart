import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Image(
      image: const AssetImage("assets/ws_logo.png"),
      width: (width / 0.2),
    );
  }
}
