import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './pages/home_page/home_page.dart';
import './pages/setting_page/setting_page.dart';
import './pages/message_page/message_page.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.home),
      title:Text('主页')
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.message),
      title:Text('消息')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.person),
      title:Text('我')
    ),
  ];
  final List tabBodies = [
    HomePage(),
    MessagePage(),
    SettingPage(),
  ];
  int currentIndex= 0;
  var currentPage ;
  @override
  void initState() {
   currentPage=tabBodies[currentIndex];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items:bottomTabs,
        onTap: (index){
          setState(() {
           currentIndex=index;
           currentPage =tabBodies[currentIndex]; 
          });
        },
      ),
      body: currentPage,
    );
  }
}