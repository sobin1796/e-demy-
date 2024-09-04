import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:morph/auth/login.dart';
import 'package:morph/homescreen/barnevigation.dart';

class SplashscreenServices {
  final auth = FirebaseAuth.instance;
  void islogin(BuildContext context) {
    final user = auth.currentUser;
    if (user != null) {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home())));
    } else {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login())));
    }
  }
}
