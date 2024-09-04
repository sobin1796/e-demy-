import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morph/commonwidget/ratingbar.dart';
import 'package:morph/const/color.dart';
import 'package:morph/const/fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class User {
  final String sectionname;
  final String length;

  User({
    required this.sectionname,
    required this.length,
  });
}

class Playenrollcourse extends StatefulWidget {
  const Playenrollcourse({super.key});

  @override
  State<Playenrollcourse> createState() => _videoplayerState();
}

// ignore: camel_case_types
class _videoplayerState extends State<Playenrollcourse> {
  TextEditingController _descriptionController = TextEditingController();
  List<User> user = [
    User(sectionname: 'Introduction', length: '2:40'),
    User(sectionname: 'Dart data types ', length: '8:20'),
    User(sectionname: 'basic widget introduction', length: '10:10'),
    User(sectionname: 'flutter First course', length: '15:20'),
  ];
  final ExpansionTileController controller = ExpansionTileController();
  final ExpansionTileController controller2 = ExpansionTileController();
  final ExpansionTileController controller3 = ExpansionTileController();
  late CustomVideoPlayerController _customVideoPlayerController;
  bool isvisible = true;
  String toggle = 'Showless';
  String cmnt = 'showles';
  String add = 'showles';
  String addtoggle = "hide";
  @override
  void initState() {
    super.initState();
    initializevideoplayer();
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
                        child: const Text(
                          'Flutter Fullcourse Review(New Course)!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      10.widthBox,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: 'By:morpha Team'
                                .text
                                .size(16)
                                .fontFamily(regular)
                                .color(subtexColor)
                                .make(),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.language,
                                color: subtexColor,
                              ),
                              'English'.text.size(14).color(subtexColor).make(),
                            ],
                          ),
                        ],
                      ),
                      30.widthBox,
                      Row(
                        children: [
                          ' Your Progress '
                              .text
                              .size(14)
                              .color(Colors.amber)
                              .make(),
                          Container(
                            height: 80,
                            child: new CircularPercentIndicator(
                              radius: 30.0,
                              lineWidth: 10.0,
                              percent: 0.60,
                              center: new Text(
                                "60%",
                                style: TextStyle(color: Colors.greenAccent),
                              ),
                              progressColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // talako lagi
            //

            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    5.heightBox,
                    Column(
                      children: [
                        5.heightBox,
                        Align(
                          alignment: Alignment.center,
                          child: Title(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: const Text(
                                'Course details',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: regular,
                                    color: FeatureColor),
                              )),
                        ),
                        10.heightBox,
                        Column(
                          children: <Widget>[
                            ExpansionTile(
                              maintainState: true,
                              controller: controller,
                              title: const Text(
                                'Course Chapters1',
                                style: TextStyle(color: Vx.amber100),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 250,
                                  width: 500,
                                  color: backgrounghilghtcolor,
                                  child: ListView.builder(
                                      itemCount: user.length,
                                      itemBuilder: ((context, index) {
                                        final users = user[index];
                                        return Container(
                                          height: 80,
                                          color: boxtilecolor,
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20.0,
                                                    vertical: 20.0),
                                            title: Text(
                                              users.sectionname,
                                              style: const TextStyle(
                                                  color: titlecolor),
                                            ),
                                            subtitle: Text(
                                              users.length,
                                              style: const TextStyle(
                                                  color: FeatureColor),
                                            ),
                                            trailing: const Icon(
                                                Icons.arrow_forward_ios),
                                            onTap: () {
                                              Get.to(() => Playenrollcourse());
                                            },
                                          ),
                                        );
                                      })),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              maintainState: true,
                              controller: controller2,
                              title: const Text(
                                'Course Chapters 2',
                                style: TextStyle(color: Vx.amber100),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 250,
                                  width: 500,
                                  color: backgrounghilghtcolor,
                                  child: ListView.builder(
                                      itemCount: user.length,
                                      itemBuilder: ((context, index) {
                                        final users = user[index];
                                        return Container(
                                          height: 80,
                                          color: boxtilecolor,
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20.0,
                                                    vertical: 20.0),
                                            title: Text(
                                              users.sectionname,
                                              style: const TextStyle(
                                                  color: titlecolor),
                                            ),
                                            subtitle: Text(
                                              users.length,
                                              style: const TextStyle(
                                                  color: FeatureColor),
                                            ),
                                            trailing: const Icon(
                                                Icons.arrow_forward_ios),
                                            onTap: () {
                                              Get.to(() => Playenrollcourse());
                                            },
                                          ),
                                        );
                                      })),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              maintainState: true,
                              controller: controller3,
                              title: const Text(
                                'Course Chapters3',
                                style: TextStyle(color: Vx.amber100),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 250,
                                  width: 500,
                                  color: backgrounghilghtcolor,
                                  child: ListView.builder(
                                      itemCount: user.length,
                                      itemBuilder: ((context, index) {
                                        final users = user[index];
                                        return Container(
                                          height: 80,
                                          color: boxtilecolor,
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20.0,
                                                    vertical: 20.0),
                                            title: Text(
                                              users.sectionname,
                                              style: const TextStyle(
                                                  color: titlecolor),
                                            ),
                                            subtitle: Text(
                                              users.length,
                                              style: const TextStyle(
                                                  color: FeatureColor),
                                            ),
                                            trailing: const Icon(
                                                Icons.arrow_forward_ios),
                                            onTap: () {
                                              Get.to(() => Playenrollcourse());
                                            },
                                          ),
                                        );
                                      })),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    20.heightBox,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [],
                    ),
                    10.heightBox,
                    const Divider(
                      thickness: 0.8,
                      color: Colors.white,
                      endIndent: 40,
                      indent: 40,
                    ),
                    20.heightBox,
                    10.heightBox,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          "Write comments"
                              .text
                              .color(FeatureColor)
                              .fontFamily(bold)
                              .size(20)
                              .make(),
                          "Rate course"
                              .text
                              .color(FeatureColor)
                              .fontFamily(bold)
                              .size(15)
                              .make(),
                          ratingbar(15, 8, 5)
                        ]),
                    TextField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 137, 165, 204)),
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                    ),

                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isvisible = !isvisible;
                            cmnt = isvisible ? 'showless' : 'Reviews';
                          });
                        },
                        child: Text(cmnt,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: regular,
                              fontSize: 14,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Visibility(
                      visible: isvisible,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: boxtilecolor,
                        ),
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.height * 0.95,
                        child: Column(
                          children: [
                            20.heightBox,
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: boxtilecolor,
                              ),
                              padding: const EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.height * 0.60,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: "sobin rai "
                                        .text
                                        .color(Colors.amber)
                                        .maxFontSize(20)
                                        .make(),
                                  ),
                                  ratingbar(10, 8, 4),
                                  5.heightBox,
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child:
                                        "i recommend this course to every one who want really learn, i loved it.It describe all basic to pro level. "
                                            .text
                                            .color(FeatureColor)
                                            .maxFontSize(20)
                                            .make(),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: FeatureColor,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: boxtilecolor,
                              ),
                              padding: const EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.height * 0.60,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: "Narayan Gautam "
                                        .text
                                        .color(Colors.amber)
                                        .maxFontSize(20)
                                        .make(),
                                  ),
                                  ratingbar(10, 8, 4),
                                  5.heightBox,
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child:
                                        " i loved it.It describe all basic to pro level. "
                                            .text
                                            .color(FeatureColor)
                                            .maxFontSize(20)
                                            .make(),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: FeatureColor,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: boxtilecolor,
                              ),
                              padding: const EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.height * 0.60,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: "Suraj Kumar Yadav "
                                        .text
                                        .color(Colors.amber)
                                        .maxFontSize(20)
                                        .make(),
                                  ),
                                  ratingbar(10, 8, 4),
                                  5.heightBox,
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child:
                                        ".It describe all basic to pro level.i liked it "
                                            .text
                                            .color(FeatureColor)
                                            .maxFontSize(20)
                                            .make(),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: FeatureColor,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Visibility(
                    //   visible: isvisible,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: boxtilecolor,
                    //     ),
                    //     height: 350,
                    //     width: 350,s
                    //     child: Column(
                    //       children: [],
                    //     ),
                    //   ),
                    // ),
                    // 10.heightBox,
                    // divider,
                    // 10.heightBox,
                    // 10.heightBox,
                    // divider,
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void initializevideoplayer() {
    CachedVideoPlayerController _CachedVideoPlayerController;
    _CachedVideoPlayerController = CachedVideoPlayerController.network(
        'https://www.w3schools.com/html/mov_bbb.mp4')
      ..initialize().then((value) {
        setState(() {});
      });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _CachedVideoPlayerController);
  }
}
