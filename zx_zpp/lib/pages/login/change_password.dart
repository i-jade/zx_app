import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordPage extends StatelessWidget {
  final registerFormKey = GlobalKey<FormState>();
  String password , newPassword , repeatPassword ;
  @override
  Widget build(BuildContext context) {
    return Provide<ThemeProvide>(builder: (context, child, themeProvide) {
      Color _color = Provide.value<ThemeProvide>(context).themeColor;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvide.themeData,
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            centerTitle: false, // 标题居中
            title: Text("修改密码"),
            elevation: 0.0, // 阴影
          ),
          backgroundColor: Colors.grey[200], // 整体背景颜色
          body: body(),
        ),
      );
    });
  }

  Widget body(){
    return Container(
          margin: EdgeInsets.only(left: ScreenUtil().setWidth((1080-850)/2),top: ScreenUtil().setHeight(300)),
          width: ScreenUtil().setWidth(850),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Form(
                key: registerFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "请输入密码",
                      ),
                      onSaved: (value) {
                        this.password = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "密码不能为空";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "新密码"),
                      obscureText: true,
                      //keyboardType: TextInputType.visiblePassword,
                      onSaved: (value) {
                        this.newPassword = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "新密码不能为空";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "再次输入新密码"),
                      obscureText: true,
                      //keyboardType: TextInputType.visiblePassword,
                      onSaved: (value) {
                        this.repeatPassword = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "新密码不能为空";
                        }
                        if(! (newPassword.compareTo(repeatPassword) == 0)){
                          return "两次输入的密码不同";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(850),
                height: ScreenUtil().setHeight(130),
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(70)),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Color.fromARGB(255, 9, 132, 227), // 设为透明色
                  child: Text(
                    "确               认",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(55),
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: registerForm,
                ),
              )
            ],
          ),
        );
  }

  void registerForm() {
    registerFormKey.currentState.save();
    registerFormKey.currentState.validate();
    //等待验证账号
    // if(!userName.isEmpty  && !userPassWord.isEmpty){
    //    print("这是来自登录的数据: username:$userName , password:$userPassWord");
    //   Application.router.navigateTo(context,"/indexPage");
    // }
    //Application.router.navigateTo(context,"/indexPage",clearStack: true);
   
  }
}