import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:morph/auth/signup.dart';
import 'package:morph/commonwidget/Snackbar.dart';
import 'package:morph/const/color.dart';
import 'package:morph/const/fonts.dart';
import 'package:morph/homescreen/barnevigation.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: themecolor,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              50.heightBox,
              Align(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Lottie.asset('assets/images/login.json'),
                ),
              ),
              const Divider(
                thickness: 2,
                color: titlecolor,
                endIndent: 60,
                indent: 60,
              ),
              30.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: 'Log IN'
                    .text
                    .color(titlecolor)
                    .size(30)
                    .fontWeight(FontWeight.bold)
                    .fontFamily(bold)
                    .make(),
              ),
              10.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: 'please fill the inputs below'
                    .text
                    .size(14)
                    .color(subtexColor)
                    .fontFamily(regular)
                    .make(),
              ),
              Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Student@gmail.com',
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromARGB(255, 65, 60, 75),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    obscureText: _obscureText,
                  ),
                  20.heightBox,
                  _isLoading
                      ? CircularProgressIndicator()
                      : TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 24, 35, 115)),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all<Size>(
                              const Size(200.0,
                                  40.0), // Adjust the width and height as needed
                            ),
                          ),
                          onPressed: () async {
                            await auth
                                .signInWithEmailAndPassword(
                                    email: _emailController.text.toString(),
                                    password:
                                        _passwordController.text.toString())
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                              Utils.showSnackBar(context, 'successful login');
                            });
                          },
                          child: 'Log In'
                              .text
                              .color(titlecolor)
                              .fontFamily(regular)
                              .size(18)
                              .make(),
                        ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: 'Forgot password ?'
                            .text
                            .color(titlecolor)
                            .fontFamily(semibold)
                            .make(),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => Signup()); // Navigate to Signup screen
                        },
                        child: 'Sign up  '
                            .text
                            .color(Redcolor)
                            .fontFamily(semibold)
                            .make(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
