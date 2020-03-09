import './service_url.dart';
import '../model/messagelist.dart';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';


import 'package:dio/dio.dart';


class NetUtils{
  static Dio _dio ;

  static void init() async{
    //获取临时目录
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path ;

    CookieJar cookieJar = PersistCookieJar(dir: tempPath);
    _dio = Dio(BaseOptions(baseUrl: serviceUrl,followRedirects: false))
      ..interceptors.add(CookieManager(cookieJar))
      ..interceptors.add(LogInterceptor(responseBody: true,requestBody: true));
  }

  static Future<Response> _get(
    String url , {
      Map<String , dynamic> params ,
    })async{
      try{
        Response response =  await _dio.get(url, queryParameters: params);
        return response;
      }on DioError catch(e){
        if(e == null){
          return Future.error(Response(data:-1));
        }else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          //这个地方有待进一步进行考虑
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
      }
    }


  static Future login( name , pass) async{
    var data = {'name': name, 'pass': pass};
    var response = await _get(servicePath['login'],params: data);
    return response.data ;
  }

  static Future<MessageListModel> getMessageList(BuildContext context)async{
    print("wozdve");
    var data={'isnew':true};
    var response = await _get(servicePath['getMessageList'],params:data);
    print(response.data);
    return MessageListModel.fromJson(response.data);
  }

   static Future<MessageListModel> getHistoryMessageList(BuildContext context)async{
    print("wozdve");
    var data={'isnew':false};
    var response = await _get(servicePath['getMessageList'],params:data);
    print(response.data);
    return MessageListModel.fromJson(response.data);
  }
}