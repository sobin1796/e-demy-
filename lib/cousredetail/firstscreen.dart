import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class firstsdraw extends StatelessWidget {
  const firstsdraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      color: const Color.fromARGB(255, 91, 87, 87),
      child: 'sobin'.text.bold.white.align(TextAlign.center).make(),
    );
  }
}
