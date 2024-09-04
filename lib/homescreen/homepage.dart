import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morph/commonwidget/coursettitle/coursetitle.dart';
import 'package:morph/const/color.dart';
import 'package:morph/cousredetail/videoplayer.dart';
import 'package:morph/elementlist/imagelist.dart';
import 'package:morph/elementlist/ratingvaluelist.dart';
import 'package:morph/homescreen/SearchIcon.dart';
import 'package:morph/homescreen/cartscreen/cartscreen.dart';
import 'package:morph/homescreen/profile.dart/account.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    HomepageFeaturelist();
  }

  bool isloading = true;
  List<Map<String, dynamic>> allcourse = [];
  final DatabaseReference ref = FirebaseDatabase.instance.reference();

  void HomepageFeaturelist() async {
    final DatabaseReference ref = FirebaseDatabase.instance.reference();

    final DataSnapshot snapshot = await ref.child('users').get();

    if (snapshot.value != null) {
      final Map<dynamic, dynamic> allUsersData =
          snapshot.value as Map<dynamic, dynamic>;

      List<Map<String, dynamic>> loadedCourses = [];

      allUsersData.forEach((userId, userData) {
        final Map<dynamic, dynamic> userCourses =
            userData as Map<dynamic, dynamic>;

        userCourses.forEach((key, value) {
          if (key.toString().startsWith('Coursesdetails ')) {
            final courseData = value as Map<dynamic, dynamic>;
            loadedCourses.add({
              'key': key,
              'description': courseData['description'] ?? 'No description',
              'price': courseData['price'] ?? '0.0',
              'title': courseData['title'] ?? 'Untitled',
              'url': courseData['url'] ?? '',
            });
          }
        });
        setState(() {
          isloading = false;
        });
      });

      setState(() {
        allcourse = loadedCourses;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        color: themecolor,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: backgrounghilghtcolor,
                  border: Border.all(
                    color: themecolor,
                  )),
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        color: titlecolor,
                        onPressed: () {
                          Get.to(() => const Acount());
                        },
                        icon: const Icon(Icons.person_rounded)),
                    180.widthBox,
                    Row(
                      children: [
                        IconButton(
                          color: titlecolor,
                          onPressed: () {
                            Get.to(() => CartItemList());
                          },
                          icon: const Icon(Icons.shopping_cart),
                        ),
                        IconButton(
                          color: titlecolor,
                          onPressed: () {
                            Get.to(() => SearchItem());
                          },
                          icon: const Icon(Icons.search_outlined),
                        ),
                      ],
                    ),
                  ]),
            ),
            40.heightBox,
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      height: 230,
                      itemCount: announcelist.length,
                      viewportFraction: 0.9999,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          announcelist[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 10))
                            .make();
                      }),
                  10.heightBox,
                  const Divider(
                    thickness: 0.8,
                    color: Color.fromARGB(255, 148, 145, 145),
                  ),
                  20.heightBox,
                  Align(
                    alignment: Alignment.topLeft,
                    child: "Top courses"
                        .text
                        .color(FeatureColor)
                        .bold
                        .size(25)
                        .make(),
                  ),
                  5.heightBox,
                  Card(
                    color: backgrounghilghtcolor,
                    shadowColor: const Color.fromARGB(255, 17, 17, 16),
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      height: 170,
                      width: 500,
                      child: isloading
                          ? const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Courses are loading....',
                                style: TextStyle(color: FeatureColor),
                              ),
                            )
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  allcourse.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      Get.to(() => Videoplayer(
                                          allcourse: allcourse[index]));
                                    },
                                    child: Container(
                                      height: 250,
                                      width: 178,
                                      padding: const EdgeInsets.all(7),
                                      child: Column(children: [
                                        featurelistRow(
                                          image: courselist[index],
                                          name:
                                              allcourse[index]['title'].length >
                                                      20
                                                  ? allcourse[index]['title']
                                                      .substring(0, 20)
                                                  : allcourse[index]['title'],
                                          price:
                                              "Rs." + allcourse[index]['price'],
                                          countstar: ratingcount[index],
                                        ),
                                      ]).box.make(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                  20.heightBox,
                  Align(
                    alignment: Alignment.topLeft,
                    child: "Features course "
                        .text
                        .color(FeatureColor)
                        .bold
                        .size(25)
                        .make(),
                  ),
                  5.heightBox,
                  Card(
                    color: backgrounghilghtcolor,
                    shadowColor: const Color.fromARGB(255, 17, 17, 16),
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      height: 170,
                      width: 500,
                      child: isloading
                          ? const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Courses are loading...',
                                style: TextStyle(color: FeatureColor),
                              ),
                            )
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  allcourse.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      Get.to(() => Videoplayer(
                                          allcourse: allcourse[index]));
                                    },
                                    child: Container(
                                      height: 250,
                                      width: 190,
                                      padding: const EdgeInsets.all(7),
                                      child: Column(children: [
                                        featurelistRow(
                                          image: courselist[index],
                                          name:
                                              allcourse[index]['title'].length >
                                                      20
                                                  ? allcourse[index]['title']
                                                      .substring(0, 20)
                                                  : allcourse[index]['title'],
                                          price:
                                              "Rs." + allcourse[index]['price'],
                                          countstar: ratingcount[index],
                                        ),
                                      ]).box.make(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            )),
          ]),
        ),
      ),
    );
  }
}
