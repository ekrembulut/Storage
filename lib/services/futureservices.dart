import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_storage3/Models/singers.dart';
import 'package:flutter_storage3/Models/variables.dart';

class FutureServices {
  verileriKaydet(MyVariables myInformations) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: "isim", value: myInformations.name);
    await storage.write(
        key: "cinsiyet", value: myInformations.singer.index.toString());
    await storage.write(
        key: "liste", value: jsonEncode(myInformations.fruitList));
  }

  Future<MyVariables> verileriOku() async {
    final storage = FlutterSecureStorage();
    var isim = await storage.read(key: "isim") ?? " ";
    var cinsiyetValue = await storage.read(key: "cinsiyet") ?? "0";
    Singers singo = Singers.values[int.parse(cinsiyetValue)];
    var liste = await storage.read(key: "liste");
    var myList =
        liste == null ? <String>[] : List<String>.from(jsonDecode(liste));
    return MyVariables(isim, singo, myList);
  }
}
