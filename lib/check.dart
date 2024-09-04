import 'package:flutter/material.dart';
import 'package:morph/const/color.dart';

class Gamification extends StatefulWidget {
  const Gamification({super.key});

  @override
  State<Gamification> createState() => _IniatializeCoursePageState();
}

class _IniatializeCoursePageState extends State<Gamification> {
  final List<TextEditingController> _controllers = [TextEditingController()];

  void addField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void removeField(int index) {
    setState(() {
      if (_controllers.length > 1) {
        _controllers[index].dispose();
        _controllers.removeAt(index);
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: titlecolor),
        centerTitle: true,
        title: const Text(
          'Gamification',
          style: TextStyle(color: titlecolor),
        ),
        backgroundColor: themecolor,
        shadowColor: Colors.white,
      ),
      backgroundColor: boxtilecolor,
      body: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: boxtilecolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  ..._controllers.asMap().entries.map((entry) {
                    int index = entry.key;
                    TextEditingController controller = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              autofocus: true,
                              controller: controller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: titlecolor)),
                                labelText: 'Enter the game',
                              ),
                              maxLines: 4,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: titlecolor,
                            ),
                            onPressed: () => removeField(index),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        autofocus: true,
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: boxtilecolor,
                        ),
                        onPressed: () {},
                        child: const Text('Add'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: boxtilecolor,
                        ),
                        onPressed: addField,
                        child: IconButton(
                          onPressed: addField,
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
