import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/browser.dart';
import '../../Application.dart';
import '../../provide/theme.dart';

import 'package:provide/provide.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Provide<ThemeProvide>(builder: (context, child, themeProvide) {
      Color _color = Provide.value<ThemeProvide>(context).themeColor;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvide.themeData,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                print("在首页点击了MENU");
              },
            ),
            centerTitle: true, // 标题居中
            title: Text("移动管控平台"),
            elevation: 0.0, // 阴影
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () => print("you clicked Search"),
              ),
            ],
          ),
          backgroundColor: Colors.grey[100], // 整体背景颜色
          body: Column(
            children: <Widget>[
              homeScr(_color),
              body(_color),
            ],
          ),
        ),
      );
    });
  }

  Widget homeScr(color) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(650),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(650),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  './assets/image/homeScr.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color,
                    Color.fromRGBO(255, 255, 255, 0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body(color) {
    return Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(60),
            right: ScreenUtil().setWidth(60),
            top: ScreenUtil().setHeight(60)),
        //width: ScreenUtil().setWidth(1080),
        //height: ScreenUtil().setHeight(333),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MyCard(
                    "./assets/image/monitor.png", "监控视频", openProcedure, color),
                SizedBox(
                  width: ScreenUtil().setWidth(60),
                ),
                MyCard(
                    "./assets/image/setting.png", "设置", openProcedure, color),
                SizedBox(
                  width: ScreenUtil().setWidth(60),
                ),
                MyCard("./assets/image/shangwei.png", "上位机画面",
                    openProcedureMenu, color),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(60),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MyCard(
                    "./assets/image/scanner.png", "扫一扫", openScanPage, color),
                SizedBox(
                  width: ScreenUtil().setWidth(60),
                ),
                MyCard(
                    "./assets/image/information.png", "设备资料", openEquipInfoPage, color),
                SizedBox(
                  width: ScreenUtil().setWidth(60),
                ),
                MyCard("./assets/image/test.png", "测试", opneStartPage, color),
              ],
            ),
          ],
        ));
  }


  //This is a question
  Widget MyCard(imageUrl, title, Function onTap, color) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
          width: ScreenUtil().setWidth(280),
          height: ScreenUtil().setHeight(280),
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                width: ScreenUtil().setWidth(120),
                height: ScreenUtil().setHeight(120),
                child: Image.asset(
                  imageUrl,
                  color: color,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                child: Text(title),
              )
            ],
          ),
        ),
      ),
    );

    // return Container(
    //     width: ScreenUtil().setWidth(280),
    //     height: ScreenUtil().setHeight(280),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(25),
    //       //color: Colors.white,
    //     ),
    //     child: InkWell(
    //       onTap: onTap,
    //       child: Container(
    //         color: Colors.transparent,
    //         margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
    //         child: Column(
    //           children: <Widget>[
    //             Container(
    //               margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
    //               width: ScreenUtil().setWidth(120),
    //               height: ScreenUtil().setHeight(120),
    //               child: Image.asset(
    //                 imageUrl,
    //                 color: color,
    //               ),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
    //               child: Text(title),
    //             )
    //           ],
    //         ),
    //       ),
    //     ));
  }

  void openProcedure() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new Browser(
        url: "https://www.baidu.com/",
        title: "上位机画面",
      );
    }));
  }

  void openProcedureMenu() {
    Application.router.navigateTo(context, "procedurePage");
  }

  void opneStartPage() {
    Application.router.navigateTo(context, 'startPage');
  }

  void openScanPage() {
    Application.router.navigateTo(context, 'scanPage');
  }

  void openEquipInfoPage(){
    Application.router.navigateTo(context, 'equipInfo');
  }
}
