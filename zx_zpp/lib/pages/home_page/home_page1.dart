import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //高亮的颜色
        splashColor: Colors.white70, // 水波纹的颜色
      ),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 int _currentINdex = 0 ;

  void _onTabHandler(int index){
    setState(() {
      _currentINdex = index ;
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // drawer: Drawer(
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: <Widget>[
        //       // DrawerHeader(
        //       //   child: Text('header'.toUpperCase()),
        //       //   decoration: BoxDecoration(
        //       //     color: Colors.grey[100],
        //       //   ),
        //       // ),

        //       //用户信息
        //       UserAccountsDrawerHeader(
        //         accountName: Text('LYJie',style: TextStyle(fontWeight: FontWeight.bold),),
        //         accountEmail: Text('24172208288@qq.com'),
        //         currentAccountPicture: CircleAvatar(
        //           backgroundImage: NetworkImage('https://resources.ninghao.org/images/wanghao.jpg'),
        //         ),
        //         decoration: BoxDecoration(
        //           color: Colors.yellow[400],
        //           image: DecorationImage(
        //             image: NetworkImage('https://i.loli.net/2019/12/25/DRCF9PjeVUxWaN2.jpg'),
        //             fit: BoxFit.cover,
        //             colorFilter: ColorFilter.mode(
        //               Colors.blue[400].withOpacity(0.6),
        //               BlendMode.hardLight,
        //             ),

        //           )
        //         ),
        //       ),
        //       ListTile(
        //         title: Text('Favorite'),
        //         trailing:
        //             Icon(Icons.favorite, color: Colors.black38, size: 22.0),
        //         leading: Icon(Icons.favorite, color: Colors.black38, size: 22.0),
        //         onTap: ()=>Navigator.of(context).pop(),
        //       ),
        //          ListTile(
        //         title: Text('Setting'),
        //         trailing:
        //             Icon(Icons.settings, color: Colors.black38, size: 22.0),
        //         leading: Icon(Icons.settings, color: Colors.black38, size: 22.0),
        //         onTap: ()=>Navigator.of(context).pop(),
        //       ),
        //          ListTile(
        //         title: Text('Message'),
        //         trailing:
        //             Icon(Icons.message, color: Colors.black38, size: 22.0),
        //         leading: Icon(Icons.message, color: Colors.black38, size: 22.0),
        //         onTap: ()=>Navigator.of(context).pop(),
        //       ),
        //     ],
        //   ),
        // ), //左边的抽屉
        //  endDrawer: Text("This is right draw"),//右边的抽屉
        appBar: AppBar(
          //在默认一直抽屉的情况下不设置Leading会自动添加一个leadig
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigration',
          //   onPressed: () => print("you clicked menu"),
          // ),
          
          centerTitle: false, // 标题居中
          title: Text("主页"),
          elevation: 0.0, // 阴影
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => print("you clicked Search"),
            ),
          ],
        ),
        backgroundColor: Colors.grey[100], // 整体背景颜色
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentINdex,
          onTap: _onTabHandler,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('主页')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text('消息')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('我')
            ),
          ],
        ),
      ),
    );
  }
}

