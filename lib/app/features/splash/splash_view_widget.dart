import 'package:flutter/material.dart';

class SplashViewWidget extends StatelessWidget {
  const SplashViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/ws_logo.png"), fit: BoxFit.fitWidth),
      ),
    );
  }
}
