import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CropImageRoute extends StatefulWidget {
  CropImageRoute(this.image);

  File image; //原始图片路径

  @override
  _CropImageRouteState createState() => new _CropImageRouteState();
}

class _CropImageRouteState extends State<CropImageRoute> {
  double baseLeft; //图片左上角的x坐标
  double baseTop; //图片左上角的y坐标
  double imageWidth; //图片宽度，缩放后会变化
  double imageScale = 1; //图片缩放比例
  Image imageView;
  final cropKey = GlobalKey<CropState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black26,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Crop.file(
                    widget.image,
                    key: cropKey,
                    aspectRatio: 1.0,
                    alwaysShowGrid: true,
                  ),
                ),
                Positioned(
                  bottom: ScreenUtil().setHeight(200),
                  left: ScreenUtil().setWidth(60),
                  child: Container(
                    width: ScreenUtil().setWidth(960),
                    height: ScreenUtil().setHeight(150),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        _crop(widget.image);
                      },
                      child: Text('ok'),
                    ),
                  ),
                )
              ],
            )));
  }

  Future<void> _crop(File originalFile) async {
    final crop = cropKey.currentState;
    final area = crop.area;
    if (area == null) {
      //裁剪结果为空
      print('裁剪不成功');
    }
    await ImageCrop.requestPermissions().then((value) {
      if (value) {
        ImageCrop.cropImage(
          file: originalFile,
          area: crop.area,
        ).then((value) {
          print(value);
        }).catchError(() {
          print('裁剪不成功');
        });
      } else {
        print(value);
      }
    });
  }

  // ///上传头像
  // void upload(File file) {
  //   print(file.path);
  //   Dio dio = Dio();
  //   dio
  //       .post("http://your ip:port/",
  //           data: FormData.from({'file': file}))
  //       .then((response) {
  //     if (!mounted) {
  //       return;
  //     }
  //     //处理上传结果
  //     UploadIconResult bean = UploadIconResult(response.data);
  //     print('上传头像结果 $bean');
  //     if (bean.code == '1') {
  //       Navigator.pop(context, bean.data.url);//这里的url在上一页调用的result可以拿到
  //     } else {
  //       Navigator.pop(context, '');
  //     }
  //   });
  // }
}
