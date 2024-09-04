import 'package:flutter/material.dart';
import 'package:morph/const/color.dart';
import 'package:morph/const/fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MCQcollection extends StatefulWidget {
  const MCQcollection({super.key});

  @override
  State<MCQcollection> createState() => _MCQcollectionState();
}

enum SingingCharacter { A, B, C, D }

class _MCQcollectionState extends State<MCQcollection> {
  SingingCharacter? _character = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: FeatureColor),
        centerTitle: true,
        title: const Text(
          "MCQ",
          style: TextStyle(color: FeatureColor),
        ),
        backgroundColor: boxcolor,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: context.screenHeight,
        width: context.screenWidth,
        color: themecolor,
        child: Column(
          children: [
            20.heightBox,
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: boxcolor,
              ),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.87,
              child: Column(
                children: [
                  10.heightBox,
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Question no.1',
                      style: TextStyle(
                          color: Color.fromARGB(255, 184, 173, 140),
                          fontFamily: bold,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Which type of Dart programming is ?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 184, 173, 140),
                          fontFamily: bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            30.heightBox,
            const Divider(
              thickness: 1,
              color: titlecolor,
              endIndent: 60,
              indent: 60,
            ),
            40.heightBox,
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text(
                    'Drat is oops',
                    style: TextStyle(color: FeatureColor),
                  ),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.A,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Dart is pop',
                    style: TextStyle(color: FeatureColor),
                  ),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.B,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Dart is ASP',
                    style: TextStyle(color: FeatureColor),
                  ),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.C,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'All of above',
                    style: TextStyle(color: FeatureColor),
                  ),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.D,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                200.widthBox,
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: themecolor,
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.centerLeft,
                    // ignore: sort_child_properties_last
                    child: Align(
                      alignment: Alignment.center,
                      child: 'submit'
                          .text
                          .fontFamily(regular)
                          .color(Colors.white)
                          .make(),
                    ),
                    height: 40,
                    width: 90,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
