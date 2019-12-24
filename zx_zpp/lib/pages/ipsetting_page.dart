import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IpSettingPage extends StatefulWidget {
  IpSettingPage({Key key}) : super(key: key);

  @override
  _IpSettingPageState createState() => _IpSettingPageState();
}

class _IpSettingPageState extends State<IpSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            print("你点击了返回");
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black54,
          ),
        ),
        title: Text(
          "设置服务器地址",
          style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setSp(60),
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        elevation: 0,
      ),
      body: things(),
    );
  }

  Widget things() {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(50), top: ScreenUtil().setHeight(100),right:ScreenUtil().setWidth(50), ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "请联系公司技术支持获取服务器地址",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(45),
              color: Colors.black45,
              
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(50),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "请输入服务器地址",
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              print("改变了输入值:$value");
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(70),
          ),
          Row(
            children: <Widget>[
              Container(
                //margin:EdgeInsets.only(left: ScreenUtil().setWidth((1080-1000)/2)),
                width: ScreenUtil().setWidth(420),
                height: ScreenUtil().setHeight(110),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color.fromARGB(255, 9, 132, 227), // 设为透明色
                  child: Text(
                    "确      认",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    print("在Ip设置界面点击了确认");
                  },
                ),
              ),
              SizedBox(width: ScreenUtil().setWidth(140),),
              Container(
                width: ScreenUtil().setWidth(420),
                height: ScreenUtil().setHeight(110),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color.fromARGB(255, 9, 132, 227), // 设为透明色
                  child: Text(
                    "测      试",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    print("在Ip设置界面点击了确认");
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
