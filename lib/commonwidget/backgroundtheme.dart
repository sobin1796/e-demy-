import 'package:flutter/material.dart';

Widget bgwidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/736x/f1/3f/b3/f13fb34cc03956b16ad356f8122b9621.jpg'),
          fit: BoxFit.fill),
    ),
    child: child,
  );
}
