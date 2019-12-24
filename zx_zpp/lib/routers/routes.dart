import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes{
  static String root = '/';
  static String loginPage = '/loginPage';
  static String ipAddressPage = '/ipPage';

  static void ConfigureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context , Map<String,List<String>> params){
        print("出现错误====》未找到router");
      }
    );

    router.define(loginPage,handler: loginPageHandler);
    router.define(ipAddressPage,handler: ipAddressHandler);
  }

  
}