import 'package:flutter/material.dart';


class ThemeProvide with ChangeNotifier{
  
  Color _themeColor = Colors.blue;
  ThemeData _themeData = ThemeData(
    primaryColor: Colors.blue,
  );//主题
  Color _themeTitleColor = Colors.white ;
  //int _colorIndex = 2 ; // 主题颜色索引 

  void changeThemeData( ThemeData themeData, color , themeTitleColor){
    _themeData = themeData;
    _themeColor = color ;
    _themeTitleColor = themeTitleColor;
    //_colorIndex = colorIndex;
    notifyListeners();
  }

  ThemeData get themeData =>_themeData ; //获取主题
  Color get themeColor =>_themeColor;
  Color get themeTitleColor => _themeTitleColor;
  //int get colorIndex =>_colorIndex ; // 获取索引数字
}