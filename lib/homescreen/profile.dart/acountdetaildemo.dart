import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class demopage extends StatelessWidget {
  const demopage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Vx.gray400,
        child: const Text(
          "kam huna baki xa hai ta :)",
          style: TextStyle(
              color: Color.fromARGB(255, 251, 248, 247), fontSize: 20),
        ),
      ),
    );
  }
}
