

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './theme_index.dart';
import './config_theme.dart';

Widget Edage(name,color,context){
  return GestureDetector(
    onTap: (){
      Store.value<ThemeConfigModel>(context).$setTheme(name);
    },
    child: Container(
      color: Color(color),
      height: ScreenUtil().setHeight(50),
      width: ScreenUtil().setHeight(50),
    ),
  );
}