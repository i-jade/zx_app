import 'package:flutter/material.dart';

import '../pages/login/login_page2.dart';
import '../pages/ipsetting_page.dart';
import '../pages/home_page/home_page1.dart';
import '../pages/procedure/procedure.dart';
import '../pages/demo/start_demo.dart';
import '../pages/scan_page./scan_page.dart';
import '../pages/equipment/equipment_information.dart';
import '../pages/login/change_password.dart';
import '../widgets/video_player.dart';
import '../pages/message_page/message_page.dart';


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

Handler scanHandler = Handler(
  handlerFunc: (BuildContext context , Map<String,List<String>> params){
    return RScanDialog();
  }
);

Handler equipmentInformationHandler = Handler(
  handlerFunc: (BuildContext context , Map<String,List<String>> params){
    return EquipmentInformationPage();
  }
);

Handler changePasswordHandler = Handler(
  handlerFunc: (BuildContext context , Map<String,List<String>> params){
    return ChangePasswordPage();
  }
);


Handler videoPlayerHandler = Handler(
  handlerFunc: (BuildContext context , Map<String,List<String>> params){
    return VideoPlayer();
  }
);

Handler messageHandler = Handler(
  handlerFunc: (BuildContext context , Map<String,List<String>> params){
    return MessagePage();
  }
);