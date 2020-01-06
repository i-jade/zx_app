import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/theme_list.dart';

Widget chooseColor(context) {
  return Container(
      color: Colors.grey[200],
      height: ScreenUtil().setHeight(900),
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
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(60),
              left: ScreenUtil().setWidth(60),
              right: ScreenUtil().setWidth(60),
            ),
            height: ScreenUtil().setHeight(150),
            width: ScreenUtil().setWidth(960),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
            ),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("取消"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
              ),
            ),
          )
        ],
      ));
}
