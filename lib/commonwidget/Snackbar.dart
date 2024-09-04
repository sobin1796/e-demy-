import 'package:flutter/material.dart';
import 'package:morph/const/color.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Row(
          children: [
            const Icon(Icons.check, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
      ),
      backgroundColor: boxcolor,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'UNDO',
        textColor: const Color.fromARGB(255, 35, 183, 12),
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
