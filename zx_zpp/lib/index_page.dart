import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:badges/badges.dart';

import './pages/home_page/home_page.dart';
import './pages/setting_page/setting_page.dart';
import './pages/message_page/message_page.dart';
import './provide/theme.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon:Icon(Icons.home,size: ScreenUtil().setHeight(80),),
        title: Text('主页')),
    BottomNavigationBarItem(
        icon: Badge(
          badgeContent: Text("5"),
          child: Icon(Icons.chat_bubble_outline,size: ScreenUtil().setHeight(80),),
        ),
        title: Text('消息')),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_outline,size: ScreenUtil().setHeight(80),),
        title: Text('我')),
  ];
  final List tabBodies = [
    HomePage(),
    MessagePage(),
    SettingPage(),
  ];
  int currentIndex = 0;
  var currentPage;
  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Provide.value<ThemeProvide>(context).themeColor,
        selectedIconTheme: IconThemeData(
          color: Provide.value<ThemeProvide>(context).themeColor,
        ),
        unselectedItemColor: Colors.black,
        unselectedIconTheme: IconThemeData(
          color: Colors.black38,
        ),
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }

  Widget iconWithSize(url) {
    return Container(
      height: ScreenUtil().setHeight(20),
      width: ScreenUtil().setWidth(20),
      child: Image.asset(url),
    );
  }
}
