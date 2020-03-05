import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes{
  static String root = '/';
  static String loginPage = '/loginPage';
  static String ipAddressPage = '/ipPage';
  static String homePage = '/homePage';
  static String indexPage = '/indexPage';
  static String procedurePage = '/procedurePage';
  static String startPage= '/startPage';
  static String scanPage='/scanPage';
  static String equipInfoPage = '/equipInfo';
  static String changPasswordPage='/changPassword';
  static String videoPlayerPage = '/videoPlayer';

  static void ConfigureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context , Map<String,List<String>> params){
        print("出现错误====》未找到router");
      }
    );

    router.define(loginPage,handler: loginPageHandler);
    router.define(ipAddressPage,handler: ipAddressHandler);
    router.define(homePage,handler: homePageHandler);
    router.define(indexPage,handler: indexPageHandler);
    router.define(procedurePage,handler: procedurePageHandler);
    router.define(startPage,handler: testHandler);
    router.define(scanPage,handler: scanHandler);
    router.define(equipInfoPage,handler: equipmentInformationHandler);
    router.define(changPasswordPage,handler: changePasswordHandler);
    router.define(videoPlayerPage,handler: videoPlayerHandler);
  }

  
}