import 'package:flutter/material.dart';

import '../pages/login_page2.dart';
import '../pages/ipsetting_page.dart';



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