import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProcedurePage extends StatelessWidget {
  const ProcedurePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("上位机画面"),
      ),
      body: body(context),
    );
  }

  Widget body(context) {
    return Container(
      margin: EdgeInsets.only(
          right: ScreenUtil().setWidth(60),
          left: ScreenUtil().setWidth(60),
          top: ScreenUtil().setWidth(60)),
      child: Column(
        children: <Widget>[
          procedureMenuCard(context),
          SizedBox(height: ScreenUtil().setHeight(40),),
          procedureMenuCard(context),
          SizedBox(height: ScreenUtil().setHeight(40),),
          procedureMenuCard(context),
          
        ],
      ),
    );
  }

  Widget procedureMenuCard(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(960),
      height: ScreenUtil().setHeight(280),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage('./assets/image/zhuxi.png')),
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: [Color.fromRGBO(0, 191, 255, 0.5), Color.fromRGBO(224, 238, 238, 1.0)],
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                right: ScreenUtil().setWidth(50),
                top: ScreenUtil().setHeight(40),
                child: Column(
                  children: <Widget>[
                    Text(
                      "主洗画面图",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(70),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10),),
                    Text(
                      "正在生产中",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(50),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
