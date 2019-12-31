import 'package:flutter/material.dart';


class ThemeConfig{
  String theme = 'blue';
}

class ThemeConfigModel extends ThemeConfig with ChangeNotifier{
  Future $setTheme(payload) async{
    theme = payload;
    notifyListeners();
  }
}