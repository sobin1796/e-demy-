import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morph/const/color.dart';
import 'package:morph/homescreen/assingmnet/assignment.dart';
import 'package:morph/homescreen/assingmnet/completedasiignment.dart';

class User {
  final String coursename;
  final String assignment;
  final String UrlAvatar;
  User(
      {required this.UrlAvatar,
      required this.assignment,
      required this.coursename});
}

class assignmentlist extends StatelessWidget {
  assignmentlist({super.key});
  List<User> user = [
    User(
        UrlAvatar:
            'https://i.pinimg.com/736x/cf/0b/74/cf0b7475f26c043b55fe50cfb98c15d5.jpg',
        assignment: 'Assignment 1',
        coursename: 'fllutter basic'),
    User(
        UrlAvatar:
            'shttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQgWejE2_K0DKRYUP09A1nuMu6CuIs3oULFak4QA4YLA&',
        assignment: 'Assignment 2',
        coursename: 'java full course'),
    User(
        UrlAvatar:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Neil_deGrasse_Tyson_in_June_2017_%28cropped%29.jpg/1200px-Neil_deGrasse_Tyson_in_June_2017_%28cropped%29.jpg',
        assignment: 'Assignment 3',
        coursename: 'Devops'),
    User(
        UrlAvatar:
            'https://i.pinimg.com/736x/cf/0b/74/cf0b7475f26c043b55fe50cfb98c15d5.jpg',
        assignment: 'Assignment 1',
        coursename: 'fllutter basic'),
    User(
        UrlAvatar:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQgWejE2_K0DKRYUP09A1nuMu6CuIs3oULFak4QA4YLA&s',
        assignment: 'Assignment 2',
        coursename: 'java full course'),
    User(
        UrlAvatar:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Neil_deGrasse_Tyson_in_June_2017_%28cropped%29.jpg/1200px-Neil_deGrasse_Tyson_in_June_2017_%28cropped%29.jpg',
        assignment: 'Assignment 3',
        coursename: 'Devops'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shadowColor: Colors.white,
        foregroundColor: Colors.red,
        backgroundColor: themecolor,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: boxtilecolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: titlecolor))),
            onPressed: () {
              Get.to(() => Completedassignmentlist());
            },
            child: Text(
              'Done',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
        title: const Text(
          'Assignments',
          style: TextStyle(color: titlecolor),
        ),
      ),
      body: Container(
        color: backgrounghilghtcolor,
        child: ListView.builder(
            itemCount: user.length,
            itemBuilder: ((context, index) {
              final users = user[index];
              return Card(
                color: boxtilecolor,
                semanticContainer: true,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(users.UrlAvatar),
                  ),
                  title: Text(
                    users.coursename,
                    style: TextStyle(color: titlecolor),
                  ),
                  subtitle: Text(
                    users.assignment,
                    style: TextStyle(color: FeatureColor),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(() => Asignmentpage());
                  },
                ),
              );
            })),
      ),
    );
  }
}
