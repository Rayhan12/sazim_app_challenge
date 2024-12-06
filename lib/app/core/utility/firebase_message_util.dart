import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sazim_app/app/core/services/auth_service.dart';



class FCMUtil {

  FCMUtil._internal();

  static final FCMUtil _instance = FCMUtil._internal();

  static FCMUtil get instance => _instance;
  String token = "";
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<String?> initializeFCM() async{
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');


    // Combine Android initialization settings
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    // Initialize the Flutter Local Notifications Plugin
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Request notification permissions from the user for Firebase Messaging
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    await FirebaseMessaging.instance.getToken().then((token) {
      print(token);
      this.token = token!;
      print(this.token);
      return token.toString();
    },);
    return null;
  }

  void configureFCMListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Message clicked!");
      print(message);
      // Navigate based on notification data
    });
  }


  Future<void> showNotification(RemoteMessage message) async {
    if (message.notification != null) {
      // Define Android-specific notification details
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'high_importance_channel', // Channel ID
        'High Importance Notifications', // Channel name
        importance: Importance.max,
        priority: Priority.high,
        showWhen: true,
      );


      // Combine platform-specific notification details
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
      );

      // Display the notification
      await flutterLocalNotificationsPlugin.show(
        message.hashCode, // Unique notification ID
        message.notification?.title, // Notification title
        message.notification?.body, // Notification body
        platformChannelSpecifics,
      );
    }
  }

  Future<void> handleBackgroundNotification(RemoteMessage message) async {
    print("BG MESSAGE");
    print(message);
  }
}



