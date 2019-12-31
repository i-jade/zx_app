import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';


import './pages/login_page.dart';
import './pages/login_page2.dart';
import './routers/routes.dart';
import './Application.dart';
import './provide/theme.dart';

import 'package:provide/provide.dart';



//第三方插件
import 'package:fluro/fluro.dart';

void main() {
  var themeProvide = ThemeProvide();
  var providers = Providers();
  providers
    ..provide(Provider<ThemeProvide>.value(themeProvide));
    runApp(ProviderNode(
      child:MyApp(),
      providers:providers,
    )
  );

} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  

    final router = Router();
    Routes.ConfigureRoutes(router);
    Application.router = router ;
    


     if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage2(),
    );
  }
}