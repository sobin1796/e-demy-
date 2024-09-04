import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:morph/auth/login.dart';
import 'package:morph/commonwidget/Snackbar.dart';
import 'package:morph/const/color.dart';
import 'package:morph/homescreen/assingmnet/assignment.dart';
import 'package:morph/homescreen/barnevigation.dart';
import 'package:morph/homescreen/profile.dart/Instructorpage/Instructorcourselist.dart';
import 'package:morph/homescreen/profile.dart/Instructorpage/addcoursepage.dart';
import 'package:morph/homescreen/profile.dart/acountdetaildemo.dart';
import 'package:velocity_x/velocity_x.dart';

class Acount extends StatefulWidget {
  const Acount({super.key});

  @override
  State<Acount> createState() => _AcountState();
}

class _AcountState extends State<Acount> {
  final User? user = FirebaseAuth.instance.currentUser;

  FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  String? username;
  @override
  void initState() {
    super.initState();
    if (user != null) {
      Fetchname();
    }
  }

  Future<void> signoutUser() async {
    try {
      await auth.signOut();
      Utils.showSnackBar(context, 'signout succesful');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } catch (e) {}
  }

  Future<void> Fetchname() async {
    try {
      final snapshot =
          await _database.child('users/${user!.uid}/ProfileDetails/name').get();
      if (snapshot.exists) {
        setState(() {
          username = snapshot.value.toString();
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        color: themecolor,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                  child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(() => const Home());
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: FeatureColor,
                          )),
                      90.widthBox,
                      Align(
                        alignment: Alignment.center,
                        child: "My profile"
                            .text
                            .color(FeatureColor)
                            .bold
                            .size(18)
                            .make(),
                      ),
                    ],
                  ),
                  20.heightBox,
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 170,
                    width: 350,
                    decoration: BoxDecoration(
                        color: backgrounghilghtcolor,
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                20.heightBox,
                                '${username ?? 'no name'}'
                                    .text
                                    .size(20)
                                    .align(TextAlign.left)
                                    .bold
                                    .color(titlecolor)
                                    .make(),
                                "${user!.email ?? 'no email'}"
                                    .text
                                    .size(15)
                                    .semiBold
                                    .align(TextAlign.left)
                                    .color(Color.fromARGB(255, 88, 68, 132))
                                    .make(),
                                20.heightBox,
                                const Icon(
                                  FontAwesomeIcons.userGraduate,
                                  color: Color.fromARGB(255, 173, 178, 209),
                                )
                              ],
                            ),
                            // 130.widthBox,
                            Column(children: [
                              Container(
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 249, 249, 249)
                                          .withOpacity(0.2),
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTGNBuKZS2dQ8gViURYxqj0ih63BJgwf4e1KAPzMc1AyYVjDkc_',
                                    width: 75,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              10.heightBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext) {
                                              return AlertDialog(
                                                backgroundColor: boxtilecolor,
                                                title: const Text(
                                                  'are you sure to delete?',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                iconColor: FeatureColor,
                                                actions: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {
                                                          signoutUser();
                                                        },
                                                        child: const Text(
                                                            'Sign Out'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            'cancel'),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(
                                        FontAwesomeIcons.signOutAlt,
                                        color:
                                            Color.fromARGB(255, 173, 178, 209),
                                        size: 20,
                                      ))
                                ],
                              )
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  10.heightBox,
                  const Divider(
                    thickness: 0.5,
                    color: titlecolor,
                    endIndent: 20,
                    indent: 20,
                  ),
                  35.heightBox,
                  ListView(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: listcolor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 2, 91, 154),
                            size: 30,
                          ),
                          title: const Text(
                            'Add courses',
                            style: TextStyle(color: titlecolor),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Get.to(() => const AddCoursePage());
                              },
                              icon: const Icon(
                                Icons.navigate_next,
                                color: titlecolor,
                              )),
                        ),
                      ),
                      5.heightBox,
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: listcolor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(
                            FontAwesomeIcons.bookOpen,
                            color: Color.fromARGB(255, 2, 91, 154),
                            size: 40,
                          ),
                          title: const Text(
                            'List of courses',
                            style: TextStyle(color: titlecolor),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Get.to(() => listInstructorcourse());
                              },
                              icon: const Icon(
                                Icons.navigate_next,
                                color: titlecolor,
                              )),
                        ),
                      ),
                      5.heightBox,
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: listcolor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(
                            Icons.assessment,
                            color: Color.fromARGB(255, 2, 91, 154),
                            size: 40,
                          ),
                          title: const Text(
                            'Asignment',
                            style: TextStyle(color: titlecolor),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Get.to(() => const Asignmentpage());
                              },
                              icon: const Icon(
                                Icons.navigate_next,
                                color: titlecolor,
                              )),
                        ),
                      ),
                      5.heightBox,
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: listcolor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(
                            Icons.settings,
                            color: Color.fromARGB(255, 2, 91, 154),
                            size: 40,
                          ),
                          title: const Text(
                            'Setting & Privacy',
                            style: TextStyle(color: titlecolor),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Get.to(() => const demopage());
                              },
                              icon: const Icon(
                                Icons.navigate_next,
                                color: titlecolor,
                              )),
                        ),
                      ),
                      5.heightBox,
                      Container(
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: listcolor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(
                            FontAwesomeIcons.infoCircle,
                            color: Color.fromARGB(255, 2, 91, 154),
                            size: 40,
                          ),
                          title: const Text(
                            'About us',
                            style: TextStyle(color: titlecolor),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Get.to(() => const demopage());
                              },
                              autofocus: true,
                              icon: const Icon(
                                Icons.navigate_next,
                                color: titlecolor,
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
