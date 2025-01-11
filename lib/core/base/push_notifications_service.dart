import 'dart:developer';

import 'package:delivery_app/core/base/local_notifications_service.dart';
import 'package:delivery_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future init() async {
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    String? token = await messaging.getToken();
if (token != null) {
  sendTokenToServer(token);
} else {
  log("Token is null");
}
  
    messaging.onTokenRefresh.listen((value) {
      sendTokenToServer(value);
    });
    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
    //foreground
    handleForegroundMessage();
    // messaging.subscribeToTopic('all').then((val) {
    //   log('sub');
    // });
  
    
  }

  static Future<void> handlebackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }

  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        // show local notification
        LocalNotificationService.showBasicNotification(
          message,
        );
      },
    );
  }

  static void sendTokenToServer(String token) async {
prefs = await SharedPreferences.getInstance();
  await prefs.setString('fcm_token', token);
  log(token );
  }
}
