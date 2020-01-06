import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '.././../provide/theme.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
} 

class _MessagePageState extends State<MessagePage> {
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

  Widget body(){
    return SingleChildScrollView(
      child:Container(
        color: Colors.red,
      )
      // Column(
      //   children: <Widget>[
      //     _buildRow(),
      //     _buildRow(),
      //     _buildRow(),
      //     _buildRow(),
      //     _buildRow(),
      //   ],
      // ),
    );
  }

  Widget _buildRow(){
    return ListTile(
      title: Text("测试"),
    );
  }
}