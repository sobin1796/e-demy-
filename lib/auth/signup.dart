import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:morph/auth/login.dart';
import 'package:morph/commonwidget/Snackbar.dart';
import 'package:morph/const/color.dart';
import 'package:morph/const/fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: context.height,
        color: themecolor,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                50.heightBox,
                Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'assets/images/signup.json',
                    height: 180,
                    width: 180,
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
                  child: 'Sign up'
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
                  child: 'Please fill the inputs below'
                      .text
                      .size(14)
                      .color(subtexColor)
                      .fontFamily(regular)
                      .make(),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email address',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      20.heightBox,
                      _isLoading
                          ? CircularProgressIndicator()
                          : TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 24, 35, 115)),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                ),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(200.0, 40.0),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  _auth
                                      .createUserWithEmailAndPassword(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  )
                                      .then((value) {
                                    final User? user = _auth.currentUser;
                                    if (user != null) {
                                      _database
                                          .child(
                                              'users/${user.uid}/ProfileDetails')
                                          .set({
                                        'name': _nameController.text.trim(),
                                        'email': _emailController.text.trim(),
                                      }).then((_) {
                                        Utils.showSnackBar(
                                            context, 'Sign up successful');
                                      }).catchError((error) {
                                        Utils.showSnackBar(context,
                                            'Failed to save user data: $error');
                                      });
                                    }
                                  }).catchError((error) {
                                    Utils.showSnackBar(
                                        context, 'Sign up failed: $error');
                                  }).whenComplete(() {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  });
                                }
                              },
                              child: 'Sign Up'
                                  .text
                                  .color(titlecolor)
                                  .fontFamily(regular)
                                  .size(18)
                                  .make(),
                            ),
                      30.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: 'Already have an account?'
                                .text
                                .color(titlecolor)
                                .fontFamily(semibold)
                                .make(),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => Login());
                            },
                            child: 'Sign In '
                                .text
                                .color(Redcolor)
                                .fontFamily(semibold)
                                .make(),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
