import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:morph/const/color.dart';
import 'package:morph/const/fonts.dart';
import 'package:morph/homescreen/profile.dart/Instructorpage/Instructorcourselist.dart';
import 'package:morph/homescreen/profile.dart/Instructorpage/preview.dart';
import 'package:morph/homescreen/profile.dart/Instructorpage/uloadprogress.dart';
import 'package:velocity_x/velocity_x.dart';

class AddSection extends StatefulWidget {
  const AddSection({super.key});

  @override
  State<AddSection> createState() => _AddSectionState();
}

class _AddSectionState extends State<AddSection> {
  PlatformFile? _pickedFile;
  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _pickedFile = result.files.first;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: titlecolor),
        backgroundColor: boxtilecolor,
        centerTitle: true,
        title: const Text(
          'Add Courses',
          style: TextStyle(color: titlecolor),
        ),
      ),
      body: Container(
        height: context.screenHeight,
        width: context.screenWidth,
        color: themecolor,
        child: Column(
          children: [
            10.heightBox,
            Container(
              // padding: const EdgeInsets.all(10),
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: boxtilecolor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.98,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: boxtilecolor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: _selectFile,
                                child: const Text(
                                  'Select  Thumbnail:',
                                  style: TextStyle(fontSize: 16),
                                )),
                            Container(
                              height: 25,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 80, 97, 134),
                                  borderRadius: BorderRadius.circular(5)),
                              child: _pickedFile != null
                                  ? Text(_pickedFile!.name)
                                  : const Text(" Please Select thumbnail"),
                            ),
                          ],
                        ),
                        5.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: _selectFile,
                                child: const Text(
                                  'Select intro video:',
                                  style: TextStyle(fontSize: 16),
                                )),
                            Container(
                              height: 25,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 80, 97, 134),
                                  borderRadius: BorderRadius.circular(5)),
                              child: _pickedFile != null
                                  ? Text(_pickedFile!.name)
                                  : const Text("  please Intro video"),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: _selectFile,
                                child: const Text(
                                  'Select Directory:   ',
                                  style: TextStyle(fontSize: 16),
                                )),
                            Container(
                              height: 25,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 80, 97, 134),
                                  borderRadius: BorderRadius.circular(5)),
                              child: _pickedFile != null
                                  ? Text(_pickedFile!.name)
                                  : const Text(" File Directory"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => listInstructorcourse()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: themecolor,
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 63, 73, 102)),
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.centerLeft,
                    // ignore: sort_child_properties_last
                    child: Align(
                      alignment: Alignment.center,
                      child: 'cancel'
                          .text
                          .fontFamily(bold)
                          .color(const Color.fromARGB(255, 181, 5, 5))
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
                            builder: (context) => PreViewCourse()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: themecolor,
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 63, 73, 102)),
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.centerLeft,
                    // ignore: sort_child_properties_last
                    child: Align(
                      alignment: Alignment.center,
                      child: 'Preview'
                          .text
                          .fontFamily(regular)
                          .color(Color.fromARGB(255, 188, 174, 14))
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
                            builder: (context) => const Uploadprogress()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: themecolor,
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 63, 73, 102)),
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.centerLeft,
                    // ignore: sort_child_properties_last
                    child: Align(
                      alignment: Alignment.center,
                      child: 'upload'
                          .text
                          .fontFamily(bold)
                          .color(Color.fromARGB(255, 37, 147, 13))
                          .make(),
                    ),
                    height: 60,
                    width: 100,
                  ),
                ),
              ],
            ),
            // 50.heightBox,
            // 'uploading progress'.text.color(titlecolor).make(),
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   width: MediaQuery.of(context).size.width * 0.98,
            //   height: MediaQuery.of(context).size.height * 0.35,
            //   decoration: BoxDecoration(
            //     color: boxtilecolor,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
