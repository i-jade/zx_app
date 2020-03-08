import 'dart:async';
import '../main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



class NotificationForAll{
  static Future<void> showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        1, '上线通知', '你已经打开移动管控APP,点击查看消息', platformChannelSpecifics,
        payload: 'item x');
  }

  //更新notification
  static Future<void> showNotificationWithUpdatedChannelDescription(id) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        'your updated channel description',
        importance: Importance.Max,
        priority: Priority.High,
        channelAction: AndroidNotificationChannelAction.Update);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        id,
        'updated notification channel',
        'check settings to see updated channel description',
        platformChannelSpecifics,
        payload: 'item x');
  }

}