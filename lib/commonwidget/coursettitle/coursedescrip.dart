import 'package:flutter/material.dart';
import 'package:morph/const/color.dart';
import 'package:morph/const/fonts.dart';
import 'package:velocity_x/velocity_x.dart';

Widget(String? title, String? value) {
  return Column(
    children: [
      title!.text.fontFamily(semibold).color(titlecolor).make(),
    ],
  );
}
