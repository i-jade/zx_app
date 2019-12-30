import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey[100], // 背景颜色使用grey[100]
          appBar: AppBar(
            title: Text("Welcome"),
            elevation: 0.0,
            //当有drawer的时候自己会适配leading
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   tooltip: "Navigration",
            //   onPressed: () => print("Navigration button is pressed"),
            // ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () => print("Search Button is pressed"),
              ),
              IconButton(
                icon: Icon(Icons.add),
                tooltip: 'Add',
                onPressed: () => print("Add Button is pressed"),
              ),
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.black45,
              indicatorColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2.0,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.local_florist),
                ),
                Tab(
                  icon: Icon(Icons.change_history),
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                // DrawerHeader(
                //   child: Text('header'.toUpperCase()),
                //   decoration: BoxDecoration(
                //     color: Colors.grey[100],
                //   ),
                // ),
                UserAccountsDrawerHeader(
                  accountName: Text('Flutter',style: TextStyle(fontWeight: FontWeight.bold),),
                  accountEmail: Text('flutter@flutter.com'),
                  currentAccountPicture:CircleAvatar(
                    backgroundImage: NetworkImage('https://i.loli.net/2019/12/30/eazhA5X6l8NJfHU.jpg'),
                  ) ,
                  decoration: BoxDecoration(
                    color: Colors.yellow[400],
                    image: DecorationImage(
                      image: NetworkImage('https://i.loli.net/2019/12/30/dvJehZqyAOMTt7R.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.yellow[400].withOpacity(0.6),
                        BlendMode.color
                      )

                    )
                  ),
                ),
                ListTile(
                  title: Text(
                    "Welcome",
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(Icons.web),
                ),
                ListTile(
                  title: Text(
                    "Hello",
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(Icons.help),
                ),
                ListTile(
                  title: Text(
                    "Flutter",
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(Icons.flag),
                  onTap: ()=>Navigator.pop(context),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Icon(
                Icons.local_florist,
                size: 120,
                color: Colors.black26,
              ),
              Icon(
                Icons.change_history,
                size: 120,
                color: Colors.black26,
              ),
              Icon(
                Icons.directions_bike,
                size: 120,
                color: Colors.black26,
              ),
            ],
          ),
        ));
  }
  //使用tab
  // tab ， tabview ， tabController
}
