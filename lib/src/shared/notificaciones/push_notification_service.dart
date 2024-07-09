import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// <>
class PushNotificationService {

  static FirebaseMessaging message = FirebaseMessaging.instance;
  static String? token;

  static Future _backgroundHandler(RemoteMessage message) async {
    print('Background Hander: ${message.data}');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage Hander: ${message.data}');
  }

  static Future _onOpenMessageOpenApp(RemoteMessage message) async {
    print('OnOpenMessageOpenApp Hander: ${message.data}');
  }

  static Future initializeApp() async {

    // Push Notification
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCI0MG63059R7doUrmF8W4jM5UaLw6eEWQ',
          appId: '1:509260553460:android:d6294c676f1e9933e952a1',
          messagingSenderId: '509260553460',
          projectId: 'plataforma-monitoreo-glucosa'
      )
    );
    token = await FirebaseMessaging.instance.getToken();
    print('Token token token $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageOpenApp);

    // Local Notification

  }

}
