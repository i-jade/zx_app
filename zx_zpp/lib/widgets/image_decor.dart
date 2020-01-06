import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget iconsWithUrl(url, width, margin, thisColor) {
  return Container(
    margin: EdgeInsets.only(left: ScreenUtil().setWidth(margin)),
    height: ScreenUtil().setHeight(width),
    width: ScreenUtil().setWidth(width),
    child: Image.asset(
      url,
      color: thisColor==null ? null : thisColor,
    ),
  );
}
