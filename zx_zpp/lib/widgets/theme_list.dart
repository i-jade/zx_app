import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provide/theme.dart';
import 'package:provide/provide.dart';

Widget themeList(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(60),
        right: ScreenUtil().setWidth(60),
        top: ScreenUtil().setHeight(60)),
    width: ScreenUtil().setWidth(1080),
    height: ScreenUtil().setHeight(350),
    //color: Colors.blue,
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            themeItem(Color.fromRGBO(0, 245, 255, 1.0), context),
            themeItem(Colors.red, context),
            themeItem(Colors.yellow, context),
            themeItem(Colors.pink, context),
            themeItem(Colors.purple, context),
            themeItem(Colors.blue[100], context),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(60),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            themeItem(Colors.deepPurple, context),
            themeItem(Colors.green, context),
            themeItem(Colors.red[200], context),
            themeItem(Colors.blue, context),
            themeItem(Colors.blue[900], context),
            themeItem(Colors.yellow[700], context),
          ],
        ),
      ],
    ),
  );
}

Widget themeItem(color, context) {
  return GestureDetector(
    onTap: () {
      Provide.value<ThemeProvide>(context)
          .changeThemeData(ThemeData(primaryColor: color));
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      height: ScreenUtil().setHeight(135),
      width: ScreenUtil().setWidth((1080-120-170)/6),
    ),
  );
}
