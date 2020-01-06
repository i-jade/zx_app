import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/theme.dart';
import '../../widgets/image_decor.dart';

class EquipmentInformationPage extends StatefulWidget {
  EquipmentInformationPage({Key key}) : super(key: key);

  @override
  _EquipmentInformationPageState createState() =>
      _EquipmentInformationPageState();
}

class _EquipmentInformationPageState extends State<EquipmentInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Provide<ThemeProvide>(builder: (context, child, themeProvide) {
      Color _color = Provide.value<ThemeProvide>(context).themeColor;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvide.themeData,
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
            extendBodyBehindAppBar: false,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              centerTitle: false, // 标题居中
              title: Text("设备资料"),
              elevation: 0.0, // 阴影
              bottom: TabBar(
                unselectedLabelColor: Colors.black45,
                indicatorColor: Colors.black54,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2.0,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.devices),
                    text: "设备属性",
                  ),
                  Tab(
                    icon: Icon(Icons.description),
                    text: "设备信息",
                  ),
                  Tab(
                    icon: Icon(Icons.perm_media),
                    text: "资料图纸",
                  ),
                  Tab(
                    icon: Icon(Icons.assignment),
                    text: "维护记录",
                  ),
                  Tab(
                    icon: Icon(Icons.assessment),
                    text: "运行记录",
                  )
                ],
              ),
            ),
            backgroundColor: Colors.grey[200], // 整体背景颜色
            body: TabBarView(
              children: <Widget>[
               Icon(Icons.devices,size: 80.0,),
               Icon(Icons.description,size: 80.0,),
               Icon(Icons.perm_media,size: 80.0,),
               Icon(Icons.assignment,size: 80.0,),
               Icon(Icons.assessment,size: 80.0,),
              ],
            ),
          ),
        ),
      );
    });
  }
}
