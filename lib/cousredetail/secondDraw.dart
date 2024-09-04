import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SecondDraw extends StatelessWidget {
  const SecondDraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      color: const Color.fromARGB(255, 91, 87, 87),
      child: 'sobin rai'.text.bold.white.align(TextAlign.center).make(),
    );
  }
}
