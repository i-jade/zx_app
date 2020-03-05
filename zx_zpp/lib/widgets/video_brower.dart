import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class VideoBrower extends StatelessWidget {
  VideoBrower({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  WebViewController _webViewController;
  String filePath = 'assets/html_file/hls.html';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(1080),
              height: ScreenUtil().setHeight(600),
              color: Colors.black45,
              child: WebView(
                initialUrl: '',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _webViewController = webViewController;
                  _loadHtmlFromAssets();
                },
              ),
            ),
            Container(
               width: ScreenUtil().setWidth(1080),
              height: ScreenUtil().setHeight(600),
              color: Colors.black45,
              child: null,
            )
          ],
        ));
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
