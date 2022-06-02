import 'package:flutter/material.dart';
import 'package:flutter_storage3/Models/singers.dart';
import 'package:flutter_storage3/Models/variables.dart';
import 'package:flutter_storage3/Widgest/chechBox.dart';
import 'package:flutter_storage3/Widgest/radioButtons.dart';
import 'package:flutter_storage3/services/futureservices.dart';
import 'package:flutter_storage3/services/methods.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  List<String> fruits = [];
  Helper myHelper = Helper();
  FutureServices future = FutureServices();
  Singers currentSinger = Singers.Ianis;
  @override
  initState() {
    super.initState();
    verileriOku1();
  }

  @override
  Widget build(BuildContext context) {
    print("build calıştı");
    return Scaffold(
        appBar: AppBar(title: Text("Storage App")),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(hintText: "İsim Giriniz"),
              ),
            ),
            MyRadio(),
            MyCheckBox(myValue: (value) {
              value = fruits;
              
            }),
            TextButton(
              onPressed: () {
                print(fruits);
                print(currentSinger);
              },
              child: Text("Yazdır"),
            ),
            TextButton(
                onPressed: () {
                  var object =
                      MyVariables(_controller.text, currentSinger, fruits);
                  myHelper.verileriKaydet(object);
                },
                child: Text("Kaydet")),
          ],
        ));
  }

  void verileriOku1() async {
    var info = await myHelper.verileriOku();

    setState(() {
      _controller.text = info.name;
      fruits = info.fruitList;
      currentSinger = info.singer;
    });
  }
}
