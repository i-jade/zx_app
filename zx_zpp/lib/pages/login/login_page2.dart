import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Application.dart';
import 'package:dio/dio.dart';
import "dart:async";
import 'package:oktoast/oktoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../widgets/notification.dart';


class LoginPage2 extends StatefulWidget {
  LoginPage2({Key key}) : super(key: key);

  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final registerFormKey = GlobalKey<FormState>();
  String userName, userPassWord;
  bool isbusy = false;

  @override
  void initState() {
    // TODO: implement initState
    isbusy = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1080, height: 2358, allowFontScaling: false)
          ..init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          circle(Color.fromARGB(255, 9, 132, 227), -1250, -540, 2160, 2160),
          logo(),
          allThing(),
          setting(),
          isbusy
              ? _loadingContainer
              : Container(
                  child: null,
                )
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

  Widget setting() {
    return Positioned(
        bottom: ScreenUtil().setHeight(50),
        right: ScreenUtil().setWidth(80),
        child: InkWell(
          onTap: () async {
            Application.router.navigateTo(context, "/ipPage");
            print("我即将跳转");
          },
          child: Icon(
            Icons.settings,
            color: Colors.black54,
            size: 30,
          ),
        ));
  }

  void registerForm() async {
    FocusScope.of(context).requestFocus(FocusNode());
    registerFormKey.currentState.save();
    registerFormKey.currentState.validate();
    //等待验证账号
    if (!userName.isEmpty && !userPassWord.isEmpty) {
      if (userName == "1") {
        
        NotificationForAll.showNotification();
        Application.router.navigateTo(context, "/indexPage", clearStack: true);
      }
      setState(() {
        isbusy = true;
      });
      print("这是来自登录的数据: username:$userName , password:$userPassWord");
      getHttp(userName, userPassWord).then((val) {
        setState(() {
          isbusy = false;
        });
        print(val['data']['name']);
        if (val['data']['name']) {
          Application.router.navigateTo(context, "/indexPage");
        } else {
          showToast("账号和密码错误，请重试");
          print("登录失败，请重试");
          userPassWord = '';
          registerFormKey.currentState.reset();
        }
      });
    }
    //Application.router.navigateTo(context,"/indexPage",clearStack: true);
  }

  Future getHttp(user, password) async {
    try {
      Response response;
      var data = {'name': user, 'password': password};
      response = await Dio().get(
          "http://192.168.137.1:7300/mock/5e1871e45f790c4fdc9cf739/zxauto/login",
          queryParameters: data);
      //print(response.data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

  //使用Column测试问题
  Widget allThing() {
    return Positioned(
        top: ScreenUtil().setHeight(950),
        left: ScreenUtil().setWidth((1080 - 850) / 2),
        child: Container(
          width: ScreenUtil().setWidth(850),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
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
              Container(
                width: ScreenUtil().setWidth(850 / 2),
                height: ScreenUtil().setHeight(110),
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(70)),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color.fromARGB(255, 9, 132, 227), // 设为透明色
                  child: Text(
                    "登       录",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: registerForm,
                ),
              )
            ],
          ),
        ));
  }

  final _loadingContainer = Container(
      constraints: BoxConstraints.expand(),
      color: Colors.black12,
      child: Center(
        child: Opacity(
          opacity: 0.9,
          child: SpinKitWave(
            color: Colors.blue,
            size: 50.0,
          ),
        ),
      ));
}
