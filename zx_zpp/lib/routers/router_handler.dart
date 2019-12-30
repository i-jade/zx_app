import 'package:flutter/material.dart';

import '../pages/login_page2.dart';
import '../pages/ipsetting_page.dart';
import '../pages/home_page/home_page1.dart';
import '../pages/procedure/procedure.dart';
import '../pages/demo/start_demo.dart';

import '../index_page.dart';



import 'package:fluro/fluro.dart';

Handler loginPageHandler = Handler(
  handlerFunc: (BuildContext context , Map<String,List<String>> params){
    return LoginPage2();
  }
);

Handler ipAddressHandler = Handler(
  handlerFunc: (BuildContext context , Map<String,List<String>> params){
    return IpSettingPage();
  }
);

Handler homePageHandler = Handler(
  handlerFunc: (BuildContext context , Map<String,List<String>> params){
    return MyApp();
  }
);

Handler indexPageHandler = Handler(
   handlerFunc: (BuildContext context , Map<String,List<String>> params){
    return IndexPage();
  }
);

Handler procedurePageHandler = Handler(
  handlerFunc: (BuildContext context , Map<String,List<String>> params){
    return ProcedurePage();
  }
);


Handler testHandler = Handler(
  handlerFunc: (BuildContext context , Map<String,List<String>> params){
    return Start();
  }
);