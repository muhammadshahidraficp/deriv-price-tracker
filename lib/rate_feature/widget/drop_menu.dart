import 'package:flutter/material.dart';

class DropWiget extends StatelessWidget {
  DropWiget({super.key, required this.currentValue, required this.items});

  String currentValue;
  List<String> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Object>(
      onChanged: (value) {},
      // Initial Value
      value: currentValue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String item) {
        return DropdownMenuItem<Object>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}
