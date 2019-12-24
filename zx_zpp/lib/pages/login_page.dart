import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/waver.dart';
import './login_page2.dart';

//第三方插件
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final registerFormKey = GlobalKey<FormState>();
  String userName, passWord, ipAddress;
  double address_top = 0;

  void registerForm() {
    registerFormKey.currentState.save();
    print("这是来自登录的数据: username:$userName , password:$passWord");
    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage2()));
  }

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    address_top = 2500;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 2358)..init(context);
    return Scaffold(
      body: Container(
          color: Color.fromRGBO(41, 128, 185,1.0),
          height: ScreenUtil.screenHeight,
          width: ScreenUtil.screenWidth,
          child: Stack(
            children: <Widget>[
              top(),
              setting(),
              settingaddress(),
            ],
          )),
    );
  }

  Widget top() {
    return Positioned(
        top: ScreenUtil().setHeight(300),
        child: Container(
            width: ScreenUtil().setWidth(1080),
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  header(),
                  SizedBox(
                    height: ScreenUtil().setHeight(200),
                  ),
                  showText(),
                  SizedBox(
                    height: ScreenUtil().setHeight(50),
                  ),
                  login(),
                ],
              ),
            )));
  }

  Widget header() {
    return Image.asset(
      "./assets/123.png",
      width: ScreenUtil().setWidth(300),
      height: ScreenUtil().setHeight(300),
    );
  }

  Widget showText() {
    return Container(
        width: ScreenUtil().setWidth(800),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Hello",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(70),
                  fontWeight: FontWeight.bold,
                )),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Text("欢迎使用黄陵一号矿集控管理平台",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(45),
                  )),
            )
          ],
        ));
  }

  Widget login() {
    return Container(
      width: ScreenUtil().setWidth(800),
      child: Form(
        key: registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: "请输入用户名",
              ),
              onSaved: (value) {
                this.userName = value;
              },
            ),
            TextFormField(
              decoration:
                  InputDecoration(icon: Icon(Icons.https), labelText: "密码"),
              obscureText: true,
              //keyboardType: TextInputType.visiblePassword,
              onSaved: (value) {
                this.passWord = value;
              },
            ),
            SizedBox(
              height: ScreenUtil().setHeight(80),
            ),
            Container(
              width: ScreenUtil().setWidth(600),
              height: ScreenUtil().setHeight(90),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blue[200],
                    Colors.blue,
                    Colors.blue[200]
                  ]), // 渐变色
                  borderRadius: BorderRadius.circular(25)),
              child: RaisedButton(
                //color: Colors.blue[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: Colors.transparent, // 设为透明色
                elevation: 0, // 正常时阴影隐藏
                highlightElevation: 0, // 点击时阴影隐藏
                child: Text(
                  "登录",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(50), color: Colors.black),
                ),
                onPressed: registerForm,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget setting() {
    return Positioned(
        bottom: ScreenUtil().setHeight(50),
        right: ScreenUtil().setWidth(50),
        child: RaisedButton(
          color: Colors.transparent,
          elevation: 0,
          onPressed: () {
            print("即将跳转设置界面");
            address_top = ScreenUtil().setHeight(ScreenUtil.screenHeight-700);
            setState(() {
              
            });
          },
          child: Icon(
            Icons.settings,
          ),
        ));
  }

  Widget settingaddress() {
    return Positioned(
      top: address_top,
      right: ScreenUtil().setWidth(0),
      child: Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(600),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
            color: Colors.blue[100]),
        child: Center(
          child: address_setting(),
        ),
      ),
    );
  }

  Widget address_setting() {
    return Container(
      width: ScreenUtil().setWidth(800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(30),
                left: ScreenUtil().setWidth(10)),
            child: Text(
              "请设置服务器地址",
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(60),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "服务器地址"),
            obscureText: true,
            //keyboardType: TextInputType.visiblePassword,
            onSaved: (value) {
              this.ipAddress = value;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(90),
          ),
          Container(
            width: ScreenUtil().setWidth(800),
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.blue[200],
                  Colors.blue
                ]), // 渐变色
                borderRadius: BorderRadius.circular(25)),
            child: RaisedButton(
              //color: Colors.blue[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              color: Colors.transparent, // 设为透明色
              elevation: 0, // 正常时阴影隐藏
              highlightElevation: 0, // 点击时阴影隐藏
              child: Text(
                "确定",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(50), color: Colors.black),
              ),
              onPressed: () {
                print("你输入的Ip地址为:$ipAddress");
                address_top = ScreenUtil().setHeight(ScreenUtil.screenHeight);
                setState(() {
                  
                });
                  },
            ),
          ),
        ],
      ),
    );
  }
}
