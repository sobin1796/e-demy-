import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:morph/const/color.dart';
import 'package:morph/const/fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Asignmentpage extends StatefulWidget {
  const Asignmentpage({Key? key}) : super(key: key);

  @override
  State<Asignmentpage> createState() => _AsignmnetState();
}

class _AsignmnetState extends State<Asignmentpage> {
  PlatformFile? pickedfile;
  String date = 'March 29, 2024'; // Example date
  Future selectfile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedfile = result.files.first;
    });
  }

  Future uploadfile() async {
    //
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.screenWidth,
        height: context.screenHeight,
        color: themecolor,
        child: Column(
          children: [
            50.heightBox,
            Card(
              color: backgrounghilghtcolor,
              shadowColor: const Color.fromARGB(255, 17, 17, 16),
              clipBehavior: Clip.hardEdge,
              child: Container(
                height: 200,
                width: 500,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.network(
                              'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTGNBuKZS2dQ8gViURYxqj0ih63BJgwf4e1KAPzMc1AyYVjDkc_',
                              width: 75,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        15.widthBox,
                        'Ram prasad sha'
                            .text
                            .size(20)
                            .color(titlecolor)
                            .fontFamily(bold)
                            .make(),
                        70.widthBox,
                        Icon(
                          size: 36,
                          Icons.school,
                          color: Color.fromARGB(255, 86, 119, 142),
                        )
                      ],
                    ),
                    50.heightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'Flutter Basic'
                            .text
                            .size(20)
                            .color(titlecolor)
                            .fontFamily(bold)
                            .make(),
                        30.widthBox,
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: titlecolor,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Due Date: $date',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 192, 218, 245)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    15.heightBox,
                    Container(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child:
                                'Complete this given task and submit your work'
                                    .text
                                    .size(13)
                                    .color(titlecolor)
                                    .fontFamily(bold)
                                    .make(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            30.heightBox,
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Card(
                color: backgrounghilghtcolor,
                shadowColor: const Color.fromARGB(255, 17, 17, 16),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  color: backgrounghilghtcolor,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Column(
                    children: [
                      10.heightBox,
                      Row(
                        children: [
                          'Assignment-1'
                              .text
                              .size(20)
                              .color(titlecolor)
                              .fontFamily(bold)
                              .make(),
                          130.widthBox,
                          'Grade-'
                              .text
                              .size(18)
                              .fontFamily(regular)
                              .color(titlecolor)
                              .make(),
                          'A+'
                              .text
                              .size(18)
                              .fontFamily(regular)
                              .color(Colors.amber)
                              .make(),
                        ],
                      ),
                      70.heightBox,
                      if (pickedfile != null)
                        Container(
                          height: 20,
                          width: 300,
                          color: Color.fromARGB(255, 221, 221, 220),
                          child: Text(pickedfile!.name),
                        ),
                      30.heightBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 86, 119, 142),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                selectfile();
                              },
                              child: Text('select')),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 86, 119, 142),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: Text('submit')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
            'Feedback'
                .text
                .fontFamily(regular)
                .color(titlecolor)
                .size(20)
                .make(),
            Card(
              color: backgrounghilghtcolor,
              shadowColor: const Color.fromARGB(255, 17, 17, 16),
              clipBehavior: Clip.hardEdge,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.23,
              ),
            )
          ],
        ),
      ),
    );
  }
}
