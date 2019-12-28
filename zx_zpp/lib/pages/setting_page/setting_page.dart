import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //高亮的颜色
        splashColor: Colors.white70, // 水波纹的颜色
      ),
      home: Scaffold(
        extendBodyBehindAppBar:true,
        appBar: AppBar(
          centerTitle: true, // 标题居中
          title: Text(""),
          elevation: 0.0, // 阴影
          
        ),
        backgroundColor: Colors.grey[100], // 整体背景颜色
        body: body(),
      ),
    );
  }

  Widget body(){
    return Column(
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(1080),
          height: ScreenUtil().setHeight(700),
          color: Colors.blue,
          //margin: EdgeInsets.only(left: ScreenUtil().setWidth(8),right: ScreenUtil().setWidth(8),top: ScreenUtil().setHeight(200)),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
                child: Container(
                  width: ScreenUtil().setWidth(250),
                  height: ScreenUtil().setHeight(250),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child:Image.asset("./assets/12.png",fit:BoxFit.cover ,) ,
                )
              )
            ],
          ),
        )
      ],
    );
  }
}