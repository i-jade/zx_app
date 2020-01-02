import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:r_scan/r_scan.dart';
import '../../widgets/browser.dart';

class RScanDialog extends StatefulWidget {
  @override
  _RScanDialogState createState() => _RScanDialogState();
}

class _RScanDialogState extends State<RScanDialog> {
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
          if(result.message.startsWith("https:"))
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) {
              return Browser(
                url: result.message,
                title: " ",
              );
            }),
          );
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
                  Positioned(
                    left: ScreenUtil().setWidth(50),
                    top: ScreenUtil().setHeight(100),
                    child: InkWell(
                      onTap:()=> Navigator.of(context).pop(),
                      child: Icon(Icons.arrow_back,color: Colors.white,size: 50,),
                    ),
                  ),
                  RScanView(
                    controller: _controller,
                  ),
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
