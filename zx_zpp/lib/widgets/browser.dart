import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browser extends StatefulWidget {
  Browser({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;
  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  WebViewController _contraller;
  String _title = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: WebView(
        onWebViewCreated: (contraller) {
          _contraller = contraller;
        },
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (url) {
          _contraller.evaluateJavascript("document.title").then((value) {
            print(value);
            String title =value.substring(1,value.length-1);
            print(title);
            setState(() {
              _title = title;
            });
          });
        },
      ),
    );
  }
}
