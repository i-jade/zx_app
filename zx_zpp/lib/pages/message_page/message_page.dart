import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '.././../provide/theme.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

//设备编号
//设备名称
//停电理由
//停电申请时间
//停电理由
//备注
//批准人
//申请人
//操作人0

class _MessagePageState extends State<MessagePage> {
  String str1 =
      "\t\t\t\t\t\tNO：202002271158\n\t\t\t\t\t\t设备编号：301\n\t\t\t\t\t\t设备名称：301压滤机\n\t\t\t\t\t\t停电理由：按时检修\n\t\t\t\t\t\t操作人：张三\n\t\t\t\t\t\t申请人：李四\n\t\t\t\t\t\t审批人：王二\n\t\t\t\t\t\t备注：请务必注意：小心工作，你的平安是我们最大的心愿";
  String str2 =
      "\t\t\t\t\t\t上报人：李英杰\n\t\t\t\t\t\t快灰：123\n\t\t\t\t\t\t煤质：456\n\t\t\t\t\t\t数据2：98%\n\t\t\t\t\t\t数据3：94%";
  String str3 =
      "设备编号：301\t\t设备名称：301压滤机\t\t停电理由：按时检修\t\t操作人：张三\t\t申请人：李四\t\t审批人：王二\t\t备注：请务必注意：小心工作，你的平安是我们最大的心愿";
  @override
  Widget build(BuildContext context) {
    return Provide<ThemeProvide>(builder: (context, child, themeProvide) {
      Color _color = Provide.value<ThemeProvide>(context).themeColor;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvide.themeData,
        home: Scaffold(
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            centerTitle: false, // 标题居中
            title: Text("消息"),
            elevation: 0.0, // 阴影
          ),
          backgroundColor: Colors.grey[200], // 整体背景颜色
          body: body(),
        ),
      );
    });
  }

  Widget body() {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: <Widget>[
          songsList("./assets/image/ele.png", "停送电", str3),
          songsList("./assets/image/lab.png", "化验数据", "你有新的化验数据待查看"),
          songsList("./assets/image/alert.png", "报警信息", "你有新的报警信息待查看"),
          songsList("./assets/image/dispatch.png", "调度简报", "你有新的调度简报待查看"),
          songsList("./assets/image/material.png", "物资信息", "你有新的物资信息待查看"),
          songsList2("./assets/image/ele.png", "停送电", str3),
          songsList2("./assets/image/lab.png", "化验数据", "你有新的化验数据待查看"),
          songsList2("./assets/image/alert.png", "报警信息", "你有新的报警信息待查看"),
          songsList2("./assets/image/dispatch.png", "调度简报", "你有新的调度简报待查看"),
          songsList2("./assets/image/material.png", "物资信息", "你有新的物资信息待查看"),
          _buildCard("./assets/image/ele.png", "停送电", "2020-02-20 20:20",
              "停送电反馈单", str1),
          _buildCard("./assets/image/lab.png", "化验单", "2020-02-20 20:20",
              "化验数据", str2),
          _buildCard("./assets/image/ele.png", "停送电", "2020-02-20 20:20",
              "停送电反馈单", str1),
          _buildCard("./assets/image/lab.png", "化验单", "2020-02-20 20:20",
              "化验数据", str2),
          _buildCard("./assets/image/ele.png", "停送电", "2020-02-20 20:20",
              "停送电反馈单", str1),
          _buildCard("./assets/image/lab.png", "化验单", "2020-02-20 20:20",
              "化验数据", str2),
        ],
      ),
    ));
  }

  //设备编号
  //设备名称
  //停电理由
  //停电申请时间
  //停电理由
  //备注
  //批准人
  //申请人
  //操作人0

  Widget _buildRow() {
    //构建卡片列表
    return ListTile(
      title: Text(
        "测试",
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildCardForTest(iconUrl, iconTitle, iconTime, title, message) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(30),
          ScreenUtil().setWidth(10),
          ScreenUtil().setWidth(30),
          ScreenUtil().setWidth(10)),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(20),
          ScreenUtil().setWidth(20),
          ScreenUtil().setWidth(20),
          ScreenUtil().setWidth(40)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(90),
                height: ScreenUtil().setHeight(90),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                ),
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                child: ClipOval(
                  child: Image.asset(iconUrl),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                child: Text(
                  iconTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(55),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(250)),
                child: Text(
                  iconTime,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(960),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(60),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(960),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Text(message),
          )
        ],
      ),
    );
  }

  Widget _buildCard(iconUrl, iconTitle, iconTime, title, message) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      //height:ScreenUtil().setHeight(500),
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(30),
          ScreenUtil().setWidth(10),
          ScreenUtil().setWidth(30),
          ScreenUtil().setWidth(10)),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(20),
          ScreenUtil().setWidth(20),
          ScreenUtil().setWidth(20),
          ScreenUtil().setWidth(40)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(90),
                height: ScreenUtil().setHeight(90),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                ),
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                child: ClipOval(
                  child: Image.asset(iconUrl),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                child: Text(
                  iconTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(55),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(250)),
                child: Text(
                  iconTime,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(960),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(60),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(960),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Text(message),
          )
        ],
      ),
    );
  }

  Widget songsList(imgUrl, title, subtitle) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(180),
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(30),
          ScreenUtil().setWidth(15),
          ScreenUtil().setWidth(0),
          ScreenUtil().setWidth(15)),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(20),
          ScreenUtil().setWidth(20),
          ScreenUtil().setWidth(0),
          ScreenUtil().setWidth(0)),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          //color: Colors.blue,
          ),
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(100),
                height: ScreenUtil().setHeight(100),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(3),
                    ),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Container(
                                width: ScreenUtil().setWidth(350),
                                height: ScreenUtil().setHeight(70),
                                child: Text(title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(45),
                                      //fontWeight:FontWeight.bold
                                    ))),
                            Container(
                              width: ScreenUtil().setWidth(400),
                              height: ScreenUtil().setHeight(50),
                              child: Text(
                                "2020-03-08 10:03",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: ScreenUtil().setSp(45)),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ]),
                          //SizedBox(height: ScreenUtil().setHeight(2),),
                          Row(
                            children: <Widget>[
                              Container(
                                width: ScreenUtil().setWidth(800),
                                height: ScreenUtil().setHeight(50),
                                child: Text(
                                  subtitle,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: ScreenUtil().setSp(40)),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ),
            ],
          ),
          Positioned(
            right: ScreenUtil().setWidth(10),
            top: ScreenUtil().setWidth(30),
            child: Icon(
              Icons.keyboard_arrow_right,
              size: ScreenUtil().setSp(100),
              color: Colors.black54,
            ),
          ),
          
          Positioned(
              top : ScreenUtil().setHeight(158),
              right: ScreenUtil().setWidth(0),
              child: Container(
                height: ScreenUtil().setHeight(2),
                width: ScreenUtil().setWidth(900),
                child: Divider(
                  color: Colors.grey[400],
                  height: ScreenUtil().setHeight(2),
                ),
              ))
        ],
      ),
    );
  }

  Widget songsList2(imgUrl, title, subtitle) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(180),
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(30),
          ScreenUtil().setWidth(10),
          ScreenUtil().setWidth(30),
          ScreenUtil().setWidth(10)),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(20),
          ScreenUtil().setWidth(20),
          ScreenUtil().setWidth(0),
          ScreenUtil().setWidth(0)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          ),
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(100),
                height: ScreenUtil().setHeight(100),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(3),
                    ),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Container(
                                width: ScreenUtil().setWidth(350),
                                height: ScreenUtil().setHeight(70),
                                child: Text(title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(45),
                                      //fontWeight:FontWeight.bold
                                    ))),
                            Container(
                              width: ScreenUtil().setWidth(400),
                              height: ScreenUtil().setHeight(50),
                              child: Text(
                                "2020-03-08 10:03",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: ScreenUtil().setSp(45)),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ]),
                          //SizedBox(height: ScreenUtil().setHeight(2),),
                          Row(
                            children: <Widget>[
                              Container(
                                width: ScreenUtil().setWidth(800),
                                height: ScreenUtil().setHeight(50),
                                child: Text(
                                  subtitle,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: ScreenUtil().setSp(40)),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ),
            ],
          ),
          Positioned(
            right: ScreenUtil().setWidth(10),
            top: ScreenUtil().setWidth(30),
            child: Icon(
              Icons.keyboard_arrow_right,
              size: ScreenUtil().setSp(100),
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
