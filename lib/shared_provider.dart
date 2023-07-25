import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sil1/constant.dart';

class SharedProvider with ChangeNotifier {
  List<String> gecici = [];

  Future<void> setData(String liste) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    listem.add(liste);
    await prefs.setStringList('listKey', listem);
    notifyListeners();
  }

  Future<List<String>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    gecici = prefs.getStringList('listKey')!;

    return gecici;
  }

  void removeData(int key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    listem.removeAt(key);
    prefs.setStringList('listKey', listem);
    notifyListeners();
  }
}
