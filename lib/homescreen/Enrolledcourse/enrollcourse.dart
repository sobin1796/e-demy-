import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morph/const/color.dart';
import 'package:morph/homescreen/Enrolledcourse/playvideo.dart';

class User {
  final String coursename;
  final String price;
  final String thumbnail;
  final String instructer;

  User(
      {required this.thumbnail,
      required this.price,
      required this.coursename,
      required this.instructer});
}

class Enrolledcourse extends StatelessWidget {
  Enrolledcourse({super.key});
  List<User> user = [
    User(
      thumbnail:
          'https://www.excelptp.com/wp-content/uploads/2023/03/Flutter-Development-Course.jpg',
      price: 'Rs-800',
      coursename: 'Flutter basic for Beginners',
      instructer: 'Ram prasad sha',
    ),
    User(
      thumbnail:
          'https://www.vcubesoftsolutions.com/wp-content/uploads/2023/11/image.jpg',
      price: 'RS-1000',
      coursename: 'Java full course',
      instructer: 'Jeevan Rai',
    ),
    User(
      thumbnail:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxs4WGcVcbVyNWx1hCe9N7o-DBwopQx0fK5g&s',
      price: 'Rs-1500',
      coursename: 'Devops Guide course',
      instructer: 'Mahesh Acharya',
    ),
    User(
      thumbnail:
          'https://www.excelptp.com/wp-content/uploads/2023/03/Flutter-Development-Course.jpg',
      price: 'Rs-800',
      coursename: 'Flutter basic for Beginners',
      instructer: 'Ram prasad sha',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: FeatureColor),
        toolbarHeight: 80,
        shadowColor: Colors.white,
        backgroundColor: themecolor,
        title: const Text(
          'My Courses',
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
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Redcolor,
                    ),
                    width: 100,
                    height: 150,
                    child: Image.network(
                      users.thumbnail,
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(
                    users.coursename,
                    style: TextStyle(color: titlecolor),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        users.instructer,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 176, 176, 175)),
                      ),
                      Text(
                        users.price,
                        style: TextStyle(color: Colors.amber),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(() => Playenrollcourse());
                  },
                ),
              );
            })),
      ),
    );
  }
}
