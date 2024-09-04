import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:morph/commonwidget/Snackbar.dart';
import 'package:morph/const/color.dart';
import 'package:morph/const/fonts.dart';
import 'package:morph/homescreen/profile.dart/Instructorpage/Instructorcourselist.dart';
import 'package:velocity_x/velocity_x.dart';

const List<String> list = <String>[
  'English',
  'Nepali'
]; // languages  ko lagi rakheko ho hai
String dropdownVaule = list.first;

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({Key? key}) : super(key: key);

  @override
  _AddCoursePageState createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  int count = 0;
  bool isloading = false;
  File? _pickedFile;
  TextEditingController _courseNameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  final User? user = FirebaseAuth.instance.currentUser;
  final DatabaseReference databses = FirebaseDatabase.instance.ref();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      setState(() {
        _pickedFile = File(result.files.first.path!);
        ;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: boxtilecolor,
            iconTheme: const IconThemeData(color: titlecolor),
            centerTitle: true,
            title: const Text(
              "Add Course",
              style: TextStyle(color: titlecolor, fontSize: 20),
            )),
        body: KeyboardVisibilityBuilder(
          builder: (context, iskeyboadvisible) {
            return SingleChildScrollView(
              child: Container(
                width: context.screenWidth,
                height: context.screenHeight,
                color: themecolor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    20.heightBox,
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                          color: boxtilecolor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Expanded(
                          child: Column(
                            children: [
                              5.heightBox,
                              const Text(
                                "Course Details",
                                style: TextStyle(
                                  color: titlecolor,
                                  fontFamily: bold,
                                  fontSize: 16,
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                                color: titlecolor,
                                endIndent: 60,
                                indent: 60,
                              ),
                              TextFormField(
                                controller: _courseNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Title:',
                                  labelStyle: TextStyle(
                                      color: FeatureColor,
                                      fontFamily: semibold),
                                  border: UnderlineInputBorder(),
                                ),
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 137, 165, 204)),
                              ),
                              TextFormField(
                                controller: _priceController,
                                decoration: const InputDecoration(
                                  labelText: 'Price:',
                                  labelStyle: TextStyle(
                                      color: FeatureColor,
                                      fontFamily: semibold),
                                  border: UnderlineInputBorder(),
                                ),
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 137, 165, 204)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    'Languages:',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 214, 177, 27),
                                        fontSize: 16),
                                  ),
                                  DropdownButton<String>(
                                    value: dropdownVaule,
                                    icon: const Icon(
                                      Icons.arrow_downward,
                                      size: 16,
                                      color: FeatureColor,
                                    ),
                                    elevation: 10,
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownVaule = value!;
                                      });
                                    },
                                    underline: Container(
                                      height: 2,
                                      color: titlecolor,
                                    ),
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 38, 104, 165),
                                              fontSize: 16),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
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
                                        color: const Color.fromARGB(
                                            255, 80, 97, 134),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: _pickedFile != null
                                        ? Text(_pickedFile!.path)
                                        : const Text("  please Intro video"),
                                  ),
                                ],
                              ),
                              20.heightBox,
                              "Description"
                                  .text
                                  .color(FeatureColor)
                                  .fontFamily(bold)
                                  .make(),
                              TextField(
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 137, 165, 204)),
                                controller: _descriptionController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 2,
                                keyboardType: TextInputType.multiline,
                              ),
                              10.heightBox,
                              20.heightBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => listInstructorcourse());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: themecolor,
                                          border: Border.all(
                                              width: 1,
                                              color: const Color.fromARGB(
                                                  255, 63, 73, 102)),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      alignment: Alignment.centerLeft,
                                      // ignore: sort_child_properties_last
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: 'cancel'
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
                                    onTap: () async {
                                      if (_pickedFile != null) {
                                        setState(() {
                                          count++;
                                          isloading = true;
                                        });
                                        firebase_storage.Reference ref =
                                            firebase_storage
                                                .FirebaseStorage.instance
                                                .ref(
                                                    '/coursevideo/${user!.uid}' +
                                                        DateTime.now()
                                                            .microsecond
                                                            .toString());

                                        firebase_storage.UploadTask uploadTask =
                                            ref.putFile(_pickedFile!.absolute);
                                        await Future.value(uploadTask);
                                        var newurl = await ref.getDownloadURL();
                                        databses
                                            .child(
                                                'users/${user!.uid}/Coursesdetails ${DateTime.now().microsecond}')
                                            .set({
                                          'title': _courseNameController.text
                                              .toString(),
                                          'price':
                                              _priceController.text.toString(),
                                          'description': _descriptionController
                                              .text
                                              .toString(),
                                          'url': newurl,
                                        }).then((value) {
                                          setState(() {
                                            isloading = false;
                                          });
                                          Utils.showSnackBar(context,
                                              'succesfully image is uploaded');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      listInstructorcourse()));
                                        });
                                      } else {
                                        Utils.showSnackBar(context,
                                            'Kindly choose video First');
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: themecolor,
                                          border: Border.all(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 63, 73, 102)),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      alignment: Alignment.centerLeft,
                                      // ignore: sort_child_properties_last
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: isloading
                                            ? CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.white),
                                              )
                                            : 'Add section'
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    20.heightBox,
                    5.heightBox,
                  ],
                ),
              ),
            );
          },
        ));
  }
}
