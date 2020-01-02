import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/theme_list.dart';
import '../../provide/theme.dart';
import 'package:provide/provide.dart';

class SettingPage extends StatelessWidget {
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
            centerTitle: false, // 标题居中
            title: Text("我"),
            elevation: 0.0, // 阴影
          ),
          backgroundColor: Colors.grey[200], // 整体背景颜色
          body: body(context, _color),
        ),
      );
    });
  }

  Widget body(context, color) {
    return Column(
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(1080),
          height: ScreenUtil().setHeight(500),
          color: color,
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(80),
                      top: ScreenUtil().setHeight(100)),
                  child: Container(
                    width: ScreenUtil().setWidth(200),
                    height: ScreenUtil().setHeight(200),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(30)),
                        image: DecorationImage(
                          image: AssetImage("./assets/12.png"),
                          fit: BoxFit.cover,
                        )),
                  )),
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(50),
                  top: ScreenUtil().setHeight(100),
                ),
                width: ScreenUtil().setWidth(600),
                height: ScreenUtil().setHeight(180),
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
        ),
        Container(
          width: double.infinity,
          height: ScreenUtil().setHeight(200),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      width: ScreenUtil().setHeight(20),
                      color: Colors.grey[200]),
                  bottom: BorderSide(
                      width: ScreenUtil().setHeight(20),
                      color: Colors.grey[200]))),
          child: ListTile(
            title: Text("修改密码"),
            leading: iconsWithUrl("./assets/image/password.png", 75, 10),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black38,
              size: ScreenUtil().setSp(100),
            ),
            onTap: () {},
          ),
        ),
        Container(
          width: double.infinity,
          height: ScreenUtil().setHeight(160),
          color: Colors.white,
          child: ListTile(
              title: Text("主题"),
              leading: iconsWithUrl("./assets/image/themes.png", 90, 0),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black38,
                size: ScreenUtil().setSp(100),
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                          height: ScreenUtil().setHeight(700),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(20),
                                  left: ScreenUtil().setWidth(60),
                                ),
                                child: Text(
                                  "请选择主题颜色",
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                              //rSizedBox(height: ScreenUtil().setHeight(10),),
                              themeList(context),
                            ],
                          ));
                    });
              }),
        ),
        Container(
          width: double.infinity,
          height: ScreenUtil().setHeight(160),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      width: ScreenUtil().setHeight(3),
                      color: Colors.grey[200]),
               )),
          child: ListTile(
            title: Text("退出登录"),
            leading: iconsWithUrl("./assets/image/exit.png", 75, 10),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black38,
              size: ScreenUtil().setSp(100),
            ),
          ),
        )
      ],
    );
  }

  Widget iconsWithUrl(url, width, margin) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(margin)),
      height: ScreenUtil().setHeight(width),
      width: ScreenUtil().setWidth(width),
      child: Image.asset(url),
    );
  }
}
