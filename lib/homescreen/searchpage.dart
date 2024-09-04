import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:morph/const/color.dart';
import 'package:velocity_x/velocity_x.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchValue = '';
  final List<String> _suggestions = [
    'Flutter',
    'Android',
    'nodejs',
    'java script'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
          searchBackgroundColor: boxcolor,
          searchCursorColor: FeatureColor,
          showClearSearchIcon: true,
          title: const Text(
            'search.....',
            style: TextStyle(color: FeatureColor),
          ),
          backgroundColor: boxcolor,
          onSearch: (value) => setState(() => searchValue = value),
          suggestions: _suggestions),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: themecolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.heightBox,
            Row(
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: boxcolor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Flutter',
                      style: TextStyle(color: FeatureColor, fontSize: 20),
                    )),
                10.widthBox,
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: boxcolor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'React',
                      style: TextStyle(color: FeatureColor, fontSize: 20),
                    )),
              ],
            ),
            10.heightBox,
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: boxcolor,
                ),
                onPressed: () {},
                child: Text(
                  'Java',
                  style: TextStyle(color: FeatureColor, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
