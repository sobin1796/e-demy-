import 'package:flutter/material.dart';
import 'package:morph/const/color.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key, required this.labelText, required this.options});

  final String labelText;
  final Map<String, String> options;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _choice;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(color: FeatureColor, fontSize: 16),
          ),
          const SizedBox(width: 15),
          DropdownButton<String>(
            value: _choice,
            icon: const Icon(
              Icons.arrow_downward,
              size: 16,
              color: FeatureColor,
            ),
            elevation: 10,
            onChanged: (String? value) {
              setState(() {
                _choice = value!;
              });
            },
            items:
                widget.options.entries.map<DropdownMenuItem<String>>((entry) {
              return DropdownMenuItem<String>(
                value: entry.key,
                child: Text(
                  entry.value,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: titlecolor, fontSize: 16),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
