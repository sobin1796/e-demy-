import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:morph/const/color.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  bool isLoading = true;
  List<Map<String, dynamic>> allCourses = [];
  List<Map<String, dynamic>> filteredItems = [];
  final DatabaseReference ref = FirebaseDatabase.instance.reference();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchItemList();
  }

  void _refreshPage() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SearchItem()));
  }

  void searchItemList() async {
    try {
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
        });

        setState(() {
          isLoading = false;
          allCourses = loadedCourses;
          filteredItems = loadedCourses; // Initially show all items
          print('All Courses: $allCourses'); // Debugging output
        });
      } else {
        setState(() {
          isLoading = false;
          print('No data found in Firebase');
        });
      }
    } catch (e) {
      print('Error retrieving data: $e');
    }
  }

  void filterItems(String query) {
    List<Map<String, dynamic>> searchList = [];
    searchList.addAll(allCourses);

    if (query.isNotEmpty) {
      List<Map<String, dynamic>> filteredList = [];
      searchList.forEach((course) {
        final title = course['title']?.toString().toLowerCase() ?? '';
        if (title.contains(query.toLowerCase())) {
          filteredList.add(course);
        }
      });

      setState(() {
        filteredItems.clear();
        filteredItems.addAll(filteredList);
        print('Filtered Items: $filteredItems');
      });
    } else {
      setState(() {
        filteredItems.clear();
        filteredItems.addAll(allCourses);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: titlecolor,
        ),
        actions: [
          IconButton(
              onPressed: () {
                _refreshPage();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
        backgroundColor: themecolor,
        title: const Text(
          "Search Courses",
          style: TextStyle(color: titlecolor),
        ),
      ),
      body: Container(
        color: themecolor,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        filterItems(value);
                      },
                      style: const TextStyle(color: titlecolor),
                      decoration: const InputDecoration(
                        labelText: "Search",
                        labelStyle: TextStyle(color: titlecolor),
                        hintText: "Search for a course",
                        fillColor: boxcolor,
                        hintStyle: TextStyle(color: titlecolor),
                        prefixIcon: Icon(
                          Icons.search,
                          color: FeatureColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: filteredItems.isNotEmpty
                        ? ListView.builder(
                            itemCount: filteredItems.length,
                            itemBuilder: (context, index) {
                              final course = filteredItems[index];
                              return ListTile(
                                title: Text(
                                  course['title'],
                                  style: const TextStyle(color: titlecolor),
                                ),
                                subtitle: Text(
                                  course['description'],
                                  style: const TextStyle(color: titlecolor),
                                ),
                                trailing: Text(
                                  "\$${course['price']}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(246, 223, 235, 10)),
                                ),
                                onTap: () {},
                              );
                            },
                          )
                        : const Center(
                            child: Text(
                            'No courses found',
                            style: TextStyle(color: titlecolor),
                          )),
                  ),
                ],
              ),
      ),
    );
  }
}
