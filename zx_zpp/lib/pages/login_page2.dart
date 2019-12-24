import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage2 extends StatefulWidget {
  LoginPage2({Key key}) : super(key: key);

  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final registerFormKey = GlobalKey<FormState>();
  String userName, userPassWord;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 2358)..init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          circle(Color.fromARGB(255, 9, 132, 227), -1250, -540, 2160, 2160),
          logo(),
          //circle(Colors.blue[200], -100, -150, 900, 850),rgba(9, 132, 227,1.0)rgba(9, 132, 227,1.0)
          username(),
          password(),
          //nameandpassword(),
          button(),
          setting(),
        ],
      ),
    );
  }

  Widget logo() {
    return Positioned(
        top: ScreenUtil().setHeight(300),
        left: ScreenUtil().setWidth(0),
        child: Container(
          width: ScreenUtil().setWidth(1080),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(300),
                  height: ScreenUtil().setHeight(300),
                  child: Image.asset("./assets/image/logo.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
                  child: Text(
                    "移动管控平台",
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenUtil().setSp(80)),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget circle(color, top, right, width, height) {
    return Positioned(
        top: ScreenUtil().setHeight(top),
        right: ScreenUtil().setWidth(right),
        child: ClipOval(
          child: Container(
            color: color,
            width: ScreenUtil().setWidth(width),
            height: ScreenUtil().setHeight(height),
            child: null,
          ),
        ));
  }

  Widget username() {
    return Positioned(
      top: ScreenUtil().setHeight(1000),
      right: ScreenUtil().setWidth(115),
      child: Container(
        width: ScreenUtil().setWidth(850),
        height: ScreenUtil().setHeight(150),
        child: Padding(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(0)),
          child: TextFormField(
            decoration: InputDecoration(
              //icon: Icon(Icons.account_circle),
              labelText: "用户名",
              //border: InputBorder.none,
            ),
            onSaved: (value) {
              this.userName = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return "用户名不能为空";
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  Widget password() {
    return Positioned(
      top: ScreenUtil().setHeight(1220),
      right: ScreenUtil().setWidth(115),
      child: Container(
        width: ScreenUtil().setWidth(850),
        height: ScreenUtil().setHeight(150),
        // decoration: BoxDecoration(
        //     // border:
        //     //     Border.all(color: Colors.grey, width: ScreenUtil().setWidth(2)),
        //     borderRadius: BorderRadius.circular(ScreenUtil().setWidth(80))),

        child: TextFormField(
          key: registerFormKey,
          decoration: InputDecoration(
            //icon: Icon(Icons.account_circle),
            labelText: "密  码",
            //border: InputBorder.none,
          ),
          onSaved: (value) {
            this.userName = value;
          },
          validator: (value) {
            if (value.isEmpty) {
              return "密码不能为空";
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget button() {
    return Positioned(
        top: ScreenUtil().setHeight(1500),
        left: ScreenUtil().setWidth((1080 - 400) / 2),
        child: Container(
          width: ScreenUtil().setWidth(400),
          height: ScreenUtil().setHeight(120),
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Color.fromARGB(255, 9, 132, 227), // 设为透明色
            child: Text(
              "登       录",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(50), color: Colors.white,fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            onPressed: registerForm,
          ),
        ));
  }

  Widget setting() {
    return Positioned(
      bottom: ScreenUtil().setHeight(50),
      right: ScreenUtil().setWidth(80),
      child: Icon(Icons.settings,color: Colors.black54,size: 30,),
    );
  }

  void registerForm() {
    registerFormKey.currentState.save();
    registerFormKey.currentState.validate();
    print("这是来自登录的数据: username:$userName , password:$userPassWord");
  }

  Widget nameandpassword() {
    return Positioned(
      top: ScreenUtil().setHeight(1000),
      left: ScreenUtil().setWidth((1080 - 850) / 2),
      child: Container(
        width: ScreenUtil().setWidth(850),
        //height: ScreenUtil().setHeight(650),
        child: Form(
          key: registerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "请输入用户名",
                ),
                onSaved: (value) {
                  this.userName = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "账号不能为空";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "密码"),
                obscureText: true,
                //keyboardType: TextInputType.visiblePassword,
                onSaved: (value) {
                  this.userPassWord = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "密码不能为空";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
