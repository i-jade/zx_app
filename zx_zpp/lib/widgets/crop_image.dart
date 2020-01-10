import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_editor/image_editor.dart';
import 'dart:convert';
import 'dart:typed_data';

class SecondPage extends StatefulWidget {
  var file;
  SecondPage(this.file);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final editorKey = GlobalKey<ExtendedImageEditorState>();

  ImageProvider provider;

  @override
  void initState() {
    super.initState();
    provider = ExtendedFileImageProvider(widget.file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Use extended_image library"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: _pick,
          ),
          IconButton(
            icon: Icon(Icons.check),
            onPressed: crop,
          ),
        ],
      ),
      body: Center(
        child: ExtendedImage(
          image: provider,
          height: ScreenUtil().setHeight(2000),
          width: ScreenUtil().setWidth(1080),
          extendedImageEditorKey: editorKey,
          mode: ExtendedImageMode.editor,
          fit: BoxFit.contain,
          initEditorConfigHandler: (state) {
            return EditorConfig(
              maxScale: 8.0,
              cropRectPadding: EdgeInsets.all(20.0),
              hitTestSize: 20.0,
              cropAspectRatio: CropAspectRatios.ratio1_1,
            );
          },
        ),
      ),
    );
  }

  void crop() async {
    final state = editorKey.currentState;
    final rect = state.getCropRect();
    final action = state.editAction;
    final radian = action.rotateAngle;

    final flipHorizontal = action.flipY;
    final flipVertical = action.flipX;
    // final img = await getImageFromEditorKey(editorKey);
    final img = state.rawImageData;

    ImageEditorOption option = ImageEditorOption();

    option.addOption(ClipOption.fromRect(rect));
    option.addOption(
        FlipOption(horizontal: flipHorizontal, vertical: flipVertical));
    if (action.hasRotateAngle) {
      option.addOption(RotateOption(radian.toInt()));
    }

    option.outputFormat = OutputFormat.png(88);

    print(json.encode(option.toJson()));

    final start = DateTime.now();
    final result = await ImageEditor.editImage(
      image: img,
      imageEditorOption: option,
    );

    print("result.length = ${result.length}");

    final diff = DateTime.now().difference(start);

    print("image_editor time : $diff");
    // showToast("handle duration: $diff",
    //     duration: Duration(seconds: 5), dismissOtherToast: true);

    //showPreviewDialog(result);
    var image =Image.memory(result);
    print(result);
  }

  void _pick() async {
    final result = await ImagePicker.pickImage(source: ImageSource.camera);
    if (result != null) {
      print(result.absolute.path);
      provider = ExtendedFileImageProvider(result);
      setState(() {});
    }
  }

  void showPreviewDialog(Uint8List image) {
    showDialog(
      context: context,
      builder: (ctx) => GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          color: Colors.grey.withOpacity(0.5),
          child: Center(
            child: SizedBox.fromSize(
              size: Size.square(200),
              child: Container(
                child: Image.memory(image),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
