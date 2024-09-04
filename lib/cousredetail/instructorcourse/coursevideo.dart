import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:morph/commonwidget/ratingbar.dart';
import 'package:morph/const/color.dart';
import 'package:morph/const/fonts.dart';
import 'package:morph/homescreen/profile.dart/Instructorpage/Instructorcourselist.dart';
import 'package:velocity_x/velocity_x.dart';

class Instructpage extends StatefulWidget {
  final Map<String, dynamic> courses;
  const Instructpage({super.key, required this.courses});

  @override
  State<Instructpage> createState() => _InstructpageState();
}

class _InstructpageState extends State<Instructpage> {
  late CustomVideoPlayerController _customVideoPlayerController;
  bool isvisible = true;
  String toggle = 'Showless';
  String cmnt = 'showles';
  @override
  void initState() {
    super.initState();
    initializevideoplayer();
  }

  void initializevideoplayer() {
    CachedVideoPlayerController _CachedVideoPlayerController;
    _CachedVideoPlayerController = CachedVideoPlayerController.network(
        widget.courses['url'] ?? 'https://www.w3schools.com/html/mov_bbb.mp4')
      ..initialize().then((value) {
        setState(() {});
      });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _CachedVideoPlayerController);
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: themecolor,
        child: SafeArea(
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            CustomVideoPlayer(
                customVideoPlayerController: _customVideoPlayerController),
            5.heightBox,
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 249, 249, 249).withOpacity(0.2),
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ], color: themecolor),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Title(
                        color: Colors.white,
                        child: Text(
                          widget.courses['title'],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      'Rating'
                          .text
                          .size(16)
                          .fontFamily(semibold)
                          .color(subtexColor)
                          .make(),
                      const SizedBox(width: 80),
                      ratingbar(20, 0.8, 5),
                      const SizedBox(width: 60),
                      Text(
                        'Price: ' + widget.courses['price'],
                        style: const TextStyle(color: Colors.amber),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: 'By:sobin rai '
                            .text
                            .size(16)
                            .fontFamily(regular)
                            .color(subtexColor)
                            .make(),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      20.heightBox,
                      const Icon(
                        Icons.language,
                        color: subtexColor,
                      ),
                      'English'.text.size(14).color(subtexColor).make(),
                      20.widthBox,
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                            color: boxtilecolor,
                            borderRadius: BorderRadius.circular(20)),
                        child: 'participants:100+'
                            .text
                            .color(subtexColor)
                            .size(14)
                            .make(),
                      ),
                    ],
                  )
                ],
              ),
            ),
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    5.heightBox,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: boxtilecolor,
                      ),
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: Column(
                        children: [
                          5.heightBox,
                          Align(
                            alignment: Alignment.center,
                            child: Title(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: const Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: regular,
                                      color: FeatureColor),
                                )),
                          ),
                          10.heightBox,
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  widget.courses['description'] ??
                                      'no description',
                                  style: const TextStyle(color: titlecolor),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Padding(padding: EdgeInsets.all(20)),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: themecolor,
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            alignment: Alignment.centerLeft,
                            // ignore: sort_child_properties_last
                            child: Align(
                              alignment: Alignment.center,
                              child: 'Edit'
                                  .text
                                  .fontFamily(regular)
                                  .color(Colors.white)
                                  .make(),
                            ),
                            height: 60,
                            width: 100,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        listInstructorcourse()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: themecolor,
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(20)),
                            alignment: Alignment.centerLeft,
                            // ignore: sort_child_properties_last
                            child: Align(
                              alignment: Alignment.center,
                              child: 'okay'
                                  .text
                                  .fontFamily(regular)
                                  .color(Colors.white)
                                  .make(),
                            ),
                            height: 60,
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                    10.heightBox,
                    const Divider(
                      thickness: 0.8,
                      color: Colors.white,
                      endIndent: 40,
                      indent: 40,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
