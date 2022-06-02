import 'package:flutter_storage3/Models/singers.dart';
import 'package:flutter_storage3/Models/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  verileriKaydet(MyVariables variables) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('name', variables.name);
    prefs.setInt('singer', variables.singer.index);
    prefs.setStringList('fruitList', variables.fruitList);
  }

  Future<MyVariables> verileriOku() async {
    var prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('name') ?? '';
    Singers singer = Singers.values[(prefs.getInt('singer') ?? 0)];
    List<String> fruitList = prefs.getStringList('fruitList') ?? [];
    return MyVariables(name, singer, fruitList);
  }
}
