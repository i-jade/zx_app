import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './choose_color.dart';
import '../../provide/theme.dart';
import '../../widgets/choose_photo.dart';
import 'package:provide/provide.dart';
import './line_card.dart';
import '../../provide/user.dart';
import '../../Application.dart';

class SettingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provide<ThemeProvide>(builder: (context, child, themeProvide) {
      Color _color = Provide.value<ThemeProvide>(context).themeColor;
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: false, // 标题居中
          title: Text("我"),
          elevation: 0.0, // 阴影
        ),
        backgroundColor: Colors.grey[200], // 整体背景颜色
        body: body(context, _color),
      );
    });
  }

  Widget body(context, color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        heardImage(context, color),
        SizedBox(
          height: ScreenUtil().setHeight(40),
        ),
        Container(
          margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(20),
              right: ScreenUtil().setWidth(20)),
          height: ScreenUtil().setHeight(155),
          decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                  width: ScreenUtil().setHeight(2), color: Colors.grey[200]),
            )),
            child: lineCard("主题", "./assets/image/themes.png", 85, 0, 4, color,
                true, true, true, context),
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(40),
        ),
        line(155, "帮助", "./assets/image/question.png", 85, 0, 0, color, true,
            true, false, context),
        line(155, "修改密码", "./assets/image/password.png", 75, 5, 1, color, true,
            false, false, context),
        line(155, "检查更新", "./assets/image/update.png", 85, 0, 2, color, true,
            false, false, context),
        line(155, "退出登录", "./assets/image/exit.png", 75, 10, 3, color, true,
            false, true, context),
      ],
    );
  }

  Widget line(lineWidth, text, iconUrl, iconWidth, iconPadding, route, color,
      haveRightIcon, haveTop, haveBottom, context) {
    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(lineWidth),
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: lineCard(text, iconUrl, iconWidth, iconPadding, route, color,
          haveRightIcon, haveTop, haveBottom, context),
    );
  }

  void openHelp() {
    print("you clicked help");
  }

  void openUpdate() {
    print("you clicked update");
  }

  void openExit() {
    //Application.router.navigateTo(context,"/loginPage",clearStack: true);
    print("you clicked exit");
  }

  void changePassword() {}

  Future openSheme(context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        builder: (BuildContext context) {
          return chooseColor(context);
        });
  }

  Widget heardImage(context, color) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(530),
      color: color,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(150)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        builder: (BuildContext context) {
                          return ChosePhoto();
                        });
                  },
                  child: Container(
                      width: ScreenUtil().setHeight(200),
                      height: ScreenUtil().setHeight(200),
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(80),
                          top: ScreenUtil().setHeight(100)),
                      child: ClipOval(
                        child: Image.asset(
                          "./assets/12.png",
                          fit: BoxFit.cover,
                        ),
                      ))),
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(50),
                  top: ScreenUtil().setHeight(120),
                ),
                width: ScreenUtil().setWidth(600),
                height: ScreenUtil().setWidth(180),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Flutter",
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Text(
                      "THis is Flutter",
                      style: TextStyle(
                          color: Provide.value<ThemeProvide>(context)
                              .themeTitleColor,
                          fontSize: ScreenUtil().setSp(50)),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(60),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              rowtitle("2","待处理"),
              rowtitle("3","审批中"),
              rowtitle("4","测试"),
              rowtitle("1","待使用"),
            ],
          )
        ],
      ),
    );
  }

  Widget rowtitle(title, count) {
    return Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(150),
      child: Column(
        children: <Widget>[
          Text(
            count,
            style: TextStyle(fontSize: ScreenUtil().setSp(45)),
          ),
          Text(
            title,
            style: TextStyle(fontSize: ScreenUtil().setSp(45)),
          ),
        ],
      ),
    );
  }
}
