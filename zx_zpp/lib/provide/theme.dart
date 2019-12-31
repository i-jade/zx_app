import 'package:flutter/material.dart';


class ThemeProvide with ChangeNotifier{
  ThemeData _themeData = ThemeData(primaryColor: Colors.blue);//主题
  //int _colorIndex = 2 ; // 主题颜色索引 

  void changeThemeData( ThemeData themeData){
    _themeData = themeData;
    //_colorIndex = colorIndex;
    notifyListeners();
  }

  ThemeData get themeData =>_themeData ; //获取主题
  //int get colorIndex =>_colorIndex ; // 获取索引数字
}