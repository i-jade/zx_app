import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:r_scan/r_scan.dart';
import '../../widgets/browser.dart';
import '../../Application.dart';
//import 'package:lamp/lamp.dart';


class RScanDialog extends StatefulWidget {
  @override
  _RScanDialogState createState() => _RScanDialogState();
}

class _RScanDialogState extends State<RScanDialog> {
  bool open = false ;
  RScanController _controller;

  @override
  void initState() {
    super.initState();
    initController();
  }

  bool isFirst = true;

  Future<void> initController() async {
    _controller = RScanController();
    _controller.addListener(() {
      //监听扫描到的二维码
      final result = _controller.result;
      if (result != null) {
        if (isFirst) {
          isFirst = false;
          print(result);
          if (result.message.startsWith("http:") ||
              result.message.startsWith("https:"))
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) {
                return Browser(
                  url: result.message,
                  title: " ",
                );
              }),
            );else{
              Navigator.of(context).pop();
            }
          // Navigator.of(context).pop(result);
          isFirst = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder<bool>(
          future: canOpenCameraView(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return Stack(
                children: <Widget>[
                  RScanView(
                    controller: _controller,
                  ),
                  Positioned(
                      top: ScreenUtil().setHeight(200),
                      left: ScreenUtil().setWidth(290),
                      child: Container(
                        width: ScreenUtil().setWidth(500),
                        child: Center(
                          child: Text(
                            "二维码扫描",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(60),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      left: ScreenUtil().setWidth(0),
                      top: ScreenUtil().setHeight(500),
                      child: Container(
                          width: ScreenUtil().setWidth(1080),
                          height: ScreenUtil().setHeight(1080),
                          color: Colors.transparent,
                          child: Image.asset(
                            "./assets/image/scanner.png",
                            width: ScreenUtil().setWidth(1080),
                            height: ScreenUtil().setWidth(1080),
                          ))),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: ScreenUtil().setWidth(1080),
                      height: ScreenUtil().setHeight(220),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
                        color: Colors.black38,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back,color: Colors.white54,),
                            onPressed: (){
                              Application.router.navigateTo(context, "/indexPage");
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.error,color: Colors.white54,),
                            onPressed: (){
                              print("即将打开手电筒");
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
                //这个为自己写的前景
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Future<bool> canOpenCameraView() async {
    var status =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (status != PermissionStatus.granted) {
      var future = await PermissionHandler()
          .requestPermissions([PermissionGroup.camera]);
      for (final item in future.entries) {
        if (item.value != PermissionStatus.granted) {
          return false;
        }
      }
    } else {
      return true;
    }
    return true;
  }
}
