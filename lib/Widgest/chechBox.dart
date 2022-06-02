import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_storage3/Models/singers.dart';

class MyCheckBox extends StatefulWidget {
  final Function myValue;
  MyCheckBox({Key? key, required this.myValue}) : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  List<String> myList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var meyve in Meyveler.values) check(meyve),
      ],
    );
  }
  CheckboxListTile check(Meyveler meyve) {
    return CheckboxListTile(
        title: Text(meyve.name),
        value: myList.contains(describeEnum(meyve)),
        onChanged: (bool? value) {
          setState(() {
            print("CheckBox Tetiklendi");
            if (value == true) {
              myList.add(describeEnum(meyve));
            } else {
              myList.remove(describeEnum(meyve));
            }
            widget().myValue(myList);
          });
        });
  }
}
