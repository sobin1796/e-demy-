import 'package:flutter/material.dart';
import 'package:morph/commonwidget/ratingbar.dart';
import 'package:morph/const/color.dart';
import 'package:morph/const/fonts.dart';
import 'package:velocity_x/velocity_x.dart';

Widget featurelistRow({image, String? name, String? price, int? countstar}) {
  return Container(
    width: 250,
    height: 150,
    margin: const EdgeInsets.symmetric(horizontal: 1),
    decoration: BoxDecoration(
      color: themecolor,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 2),
          blurRadius: 4,
        ),
      ],
    ),
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: 80,
        ),
        name!.text.fontFamily(semibold).color(titlecolor).make(),
        Row(
          children: [
            price!.text.fontFamily(semibold).color(titlecolor).make(),
            30.widthBox,
            Expanded(
              child: SizedBox(
                  height: 10,
                  width: 30,
                  child: ratingbar(10, 0.01, countstar!)),
            ),
          ],
        ),
      ],
    ),
  );
}
