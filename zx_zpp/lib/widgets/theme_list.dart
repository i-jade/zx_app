import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provide/theme.dart';
import 'package:provide/provide.dart';

class ThemeList extends StatelessWidget {
  const ThemeList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(60),
          right: ScreenUtil().setWidth(60),
          top: ScreenUtil().setHeight(60)),
          width: ScreenUtil().setWidth(100),
          height: ScreenUtil().setHeight(200),
          color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              themeItem(Color.fromRGBO(0, 245, 255, 1.0), context),
              SizedBox(
                width: ScreenUtil().setWidth(30),
              ),
              themeItem(Colors.red, context),
              SizedBox(
                width: ScreenUtil().setWidth(30),
              ),
              themeItem(Colors.yellow, context),
              SizedBox(
                width: ScreenUtil().setWidth(30),
              ),
              themeItem(Colors.pink, context),
              SizedBox(
                width: ScreenUtil().setWidth(30),
              ),
              themeItem(Colors.purple, context),
              SizedBox(
                width: ScreenUtil().setWidth(30),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(60),),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              themeItem(Colors.deepPurple, context),
              SizedBox(
                width: ScreenUtil().setWidth(30),
              ),
              themeItem(Colors.green, context),
              SizedBox(
                width: ScreenUtil().setWidth(30),
              ),
              themeItem(Colors.orange, context),
              SizedBox(
                width: ScreenUtil().setWidth(30),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget themeItem(color,context) {
    return GestureDetector(
      onTap: () {
        Provide.value<ThemeProvide>(context)
            .changeThemeData(ThemeData(primaryColor: color));
      },
      child: Container(
        color: color,
        height: ScreenUtil().setHeight(50),
        width: ScreenUtil().setHeight(50),
      ),
    );
  }
}
