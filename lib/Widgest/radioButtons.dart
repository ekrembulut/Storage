import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_storage3/Models/singers.dart';

class MyRadio extends StatefulWidget {
  Function eko = (value) {};
  MyRadio({Key? key}) : super(key: key);

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  Singers _currentSinger = Singers.Lutcer;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var singer in Singers.values) _radio(singer),
      ],
    );
  }

  RadioListTile<Singers> _radio(Singers singer) {
    return RadioListTile(
        title: Text(singer.name),
        value: singer,
        groupValue: _currentSinger,
        onChanged: (Singers? value) {
          print("Radio Button Tetiklendi");
          setState(() {
            _currentSinger = value!;
          });
          widget().eko(_currentSinger);
        });
  }
}
