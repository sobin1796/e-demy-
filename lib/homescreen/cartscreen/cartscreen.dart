import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morph/const/color.dart';
import 'package:morph/cousredetail/instructorcourse/coursevideo.dart';
import 'package:morph/homescreen/homepage.dart';

class CartItemList extends StatefulWidget {
  @override
  State<CartItemList> createState() => _listInstructorcourseState();
}

class _listInstructorcourseState extends State<CartItemList> {
  final DatabaseReference ref = FirebaseDatabase.instance.reference();
  List<Map<String, dynamic>> courses = [];

  @override
  void initState() {
    super.initState();
    cartitemlist();
  }

  final User? user = FirebaseAuth.instance.currentUser;

  void cartitemlist() async {
    final DataSnapshot snapshot = await ref.child('users/${user!.uid}').get();

    if (snapshot.value != null) {
      final Map<dynamic, dynamic> userData =
          snapshot.value as Map<dynamic, dynamic>;

      List<Map<String, dynamic>> loadedCourses = [];

      userData.forEach((key, value) {
        if (key.toString().startsWith('cartitem')) {
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
        courses = loadedCourses;
      });
    } else {
      setState(() {
        courses = [];
      });
    }
  }

  void deleteCourse(int index) async {
    String courseKey = courses[index]['key'];
    await ref.child('users/${user!.uid}/$courseKey').remove();

    setState(() {
      courses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Cart',
            style: TextStyle(color: FeatureColor, fontSize: 20)),
        iconTheme: const IconThemeData(color: titlecolor),
        backgroundColor: const Color.fromARGB(255, 8, 27, 42),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const Homepage());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        color: themecolor,
        child: courses.isEmpty
            ? const Center(
                child: Text(
                  'No courses available',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: listcolor,
                          child: ListTile(
                            onTap: () {
                              Get.to(() => Instructpage(
                                    courses: courses[index],
                                  ));
                            },
                            title: Text(
                              courses[index]['title'],
                              style: const TextStyle(color: titlecolor),
                            ),
                            subtitle: Text(
                              courses[index]['price'],
                              style: const TextStyle(
                                  color: Color.fromARGB(246, 242, 242, 11)),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: boxtilecolor,
                                        title: const Text(
                                          'are you sure to delete?',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        iconColor: backgrounghilghtcolor,
                                        actions: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  deleteCourse(index);
                                                },
                                                child: const Text('Delete'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('cancel'),
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Color.fromARGB(246, 191, 67, 10),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
