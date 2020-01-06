import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import './cropImage.dart';

class ChosePhoto extends StatelessWidget {
  const ChosePhoto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(700),
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(60),
                  left: ScreenUtil().setWidth(60),
                  right: ScreenUtil().setWidth(60),
                ),
                height: ScreenUtil().setHeight(300),
                width: ScreenUtil().setWidth(960),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(30)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(960),
                      height: ScreenUtil().setHeight(150),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                                    ScreenUtil().setWidth(30)))),
                        onPressed: () {
                          canOpenCameraView();
                          getImage(context);
                        },
                        child: Text("拍照"),
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(960),
                      height: ScreenUtil().setHeight(150),
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1, color: Colors.grey[200]))),
                      child: FlatButton(
                        onPressed: () {
                          canReadStorage();
                          chooseImage(context);
                        },
                        child: Text("选择本地文件"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(
                                    ScreenUtil().setWidth(30)))),
                      ),
                    ),
                  ],
                )),
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
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(30)),
                ),
                child: Text("取消"),
              ),
            )
          ],
        ));
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

  Future<bool> canReadStorage() async {
    if (Platform.isIOS) return true;
    var status = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (status != PermissionStatus.granted) {
      var future = await PermissionHandler()
          .requestPermissions([PermissionGroup.storage]);
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

  //使用相机
  Future getImage(context) async {
    await ImagePicker.pickImage(source: ImageSource.camera)
        .then((image) => cropImage(image, context));
  }

  //使用本地图库
  Future chooseImage(context) async {
    await ImagePicker.pickImage(source: ImageSource.gallery)
        .then((image) => cropImage(image, context));
  }

  void cropImage(File originalImage, context) async {
    String result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CropImageRoute(originalImage)));
    if (result.isEmpty) {
      print('上传失败');
    } else {
      print(result);
      //result是图片上传后拿到的url
      // setState(() {
      //   iconUrl = result;
      //   print('上传成功：$iconUrl');
      //   _upgradeRemoteInfo();//后续数据处理，这里是更新头像信息
      // });
    }
  }
}
