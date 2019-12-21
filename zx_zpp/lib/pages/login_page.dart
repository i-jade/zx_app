import 'package:flutter/material.dart';




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
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    print("height:${ScreenUtil.screenHeight}");
    print("height:${ScreenUtil.screenWidth}");
    return Center(
       child: Text("test"),
    );
  }


  // Widget get cover =>AnimatedPositioned(
  //   duration: const Duration(seconds:2),
  //   top: 0.0,
  //   curve: Curves.easeIn,
  //   width: ,
  // );

}