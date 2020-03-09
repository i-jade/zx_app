import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:zx_zpp/config/service_method.dart';
import '.././../provide/theme.dart';
import '../../widgets/widget_future_builder.dart';
import '../../model/messagelist.dart';

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

  var map = {
    'pwr':"./assets/image/ele.png",
    'lab':"./assets/image/lab.png",
    'verb':"./assets/image/alert.png",
    'diaodu':"./assets/image/dispatch.png",
    'wuzi':"./assets/image/material.png"
  };
  var history ;

  @override
  void initState() {
    // TODO: implement initState
    history = true ;
    super.initState();
  }

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
            actions: <Widget>[
              IconButton(
                padding: EdgeInsets.only(right:ScreenUtil().setWidth(50)),
                icon: history?Icon(Icons.history,size: ScreenUtil().setWidth(90),):Icon(Icons.timer,size: ScreenUtil().setWidth(90),),
                tooltip: 'History',
                onPressed: () {
                  print("you clicked History");
                  setState(() {
                    history = !history ;
                    print("This is history ${history}");
                  });
                } ,
              ),
            ],
          ),
          backgroundColor: Colors.grey[50], // 整体背景颜色
          body: body(history),
        ),
      );
    });
  }

  Widget body(history) {
    return Container(
      height: ScreenUtil().setHeight(2000),
        child:_messageList(history),
     );
  }

  Widget _messageList(history){
    return CustomFutureBuilder<MessageListModel>(
      futureFunc: history?NetUtils.getMessageList:NetUtils.getHistoryMessageList,
      builder: (context,snapshot){
        return ListView.builder(
          itemBuilder: (context,index){
            return songsList(snapshot.data.messageList[index].module, snapshot.data.messageList[index].title, snapshot.data.messageList[index].msg);
          },
          itemCount: snapshot.data.messageList.length
        );

      },
    );
  }

  Widget songsList(imgUrl, title, subtitle) {
    var imagurl = map[imgUrl];
    return Material(
      child: RaisedButton(
        elevation: 0.0,
        highlightElevation: 0.0,
        disabledElevation: 0.0,
        color: Colors.grey[50],
        splashColor: Colors.grey,
        highlightColor: Colors.grey[300],
        onPressed: () {
          print("null");
        },
        child: Container(
          width: ScreenUtil().setWidth(1080),
          height: ScreenUtil().setHeight(210),
          margin: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(0),
              ScreenUtil().setWidth(0),
              ScreenUtil().setWidth(0),
              ScreenUtil().setWidth(0)),
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(0),
              ScreenUtil().setWidth(35),
              ScreenUtil().setWidth(0),
              ScreenUtil().setWidth(0)),
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding:
                          EdgeInsets.only(left: ScreenUtil().setWidth(140)),
                      child: Column(
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
                    ),
                  )
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
                  top: ScreenUtil().setHeight(173),
                  right: ScreenUtil().setWidth(0),
                  child: Container(
                    height: ScreenUtil().setHeight(2),
                    width: ScreenUtil().setWidth(900),
                    child: Divider(
                      color: Colors.grey[300],
                      height: ScreenUtil().setHeight(2),
                    ),
                  )),
              Positioned(
                left: ScreenUtil().setWidth(0),
                top: ScreenUtil().setHeight(20),
                child: Container(
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setWidth(100),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                      child: Image.asset(
                        imagurl,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
