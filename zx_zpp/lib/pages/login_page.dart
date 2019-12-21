import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:io';




//第三方插件
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 2358)..init(context);
    return Center(
       child: Text("test"),
    );
  }


  Widget get cover => AnimatedPositioned(
        duration: const Duration(seconds: 2),
        top: -ScreenUtil.screenHeight ,
        curve: Curves.easeIn,
        width: ScreenUtil.screenWidth,
        height: -ScreenUtil.screenHeight,
        child: Container(
          padding: EdgeInsets.all(ScreenUtil().setHeight(80)),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Center(
            child: Image.asset(
              "123.png",
              width: ScreenUtil().setHeight(240),
            ),
          ),
        ),
      );


  

}