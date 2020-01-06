import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Application.dart';
import './choose_color.dart';
import '../../widgets/image_decor.dart';

//参数
//text  标题
//iconUrl   icon的地址，本地assert数据
// iconWidth icon的宽度
// iconPadding  icon离最前面的距离
// onPressed 点击事件
// color 全局color
// haveRight 是否需要右边的箭头
//调用示例

Widget lineCard(text, iconUrl, iconWidth, iconPadding, route, color,
    haveRightIcon, haveTop, haveBottom, context) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
      bottom:
          BorderSide(width: ScreenUtil().setHeight(2), color: Colors.grey[200]),
    )),
    child: Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: RaisedButton(
          elevation: 0.0,
          highlightElevation: 0.0,
          disabledElevation: 0.0,
          color: Colors.white,
          splashColor: Colors.grey,
          highlightColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: haveTop ? Radius.circular(20) : Radius.zero,
            bottom: haveBottom ? Radius.circular(20) : Radius.zero,
          )),
          onPressed: () {
            print(route);
            if(route == 1 ){
              Application.router.navigateTo(context,"/changPassword",clearStack: false);
            }
            else if (route == 3) {
              Application.router
                  .navigateTo(context, "/loginPage", clearStack: true);
            } else {
              print("your clicked is not exit");
            }
            if (route == 4) {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  builder: (BuildContext context) {
                    return chooseColor(context);
                  });
            }
          },
          child: Container(
            height: ScreenUtil().setHeight(130),
            width: ScreenUtil().setWidth(1060),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                  child: Row(
                    children: <Widget>[
                      iconsWithUrl(iconUrl, iconWidth, iconPadding, color),
                      SizedBox(
                        width: ScreenUtil().setWidth(60),
                      ),
                      Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: ScreenUtil().setSp(52)),
                      )
                    ],
                  ),
                ),
                haveRightIcon
                    ? Positioned(
                        top: ScreenUtil().setHeight(20),
                        right: ScreenUtil().setWidth(0),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black38,
                          size: ScreenUtil().setSp(100),
                        ),
                      )
                    : null
              ],
            ),
          )),
    ),
  );
}
