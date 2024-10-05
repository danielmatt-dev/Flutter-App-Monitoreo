import 'dart:async';
import 'dart:io';

import 'package:app_plataforma/main.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/guardar_fcm_token.dart';
import 'package:app_plataforma/src/features/paciente/presentation/profile/pages/profile_screens.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// <>
class PushNotificationService {

  static final guardarFcmToken = sl<GuardarFcmToken>();

  static FirebaseMessaging message = FirebaseMessaging.instance;
  static String? token;

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'alerts_channel', // ID único del canal
    'Recomendaciones', // Nombre del canal visible para el usuario
    description: 'Este canal se utiliza para notificaciones importantes relacionadas con el monitoreo de glucosa y presión arterial.', // Descripción del canal
    importance: Importance.high,
    playSound: true,
  );

  static Future<void> initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future _backgroundHandler(RemoteMessage message) async {}

  static Future _onMessageHandler(RemoteMessage message) async {
    showLocalNotification(message);
  }

  static Future _onOpenMessageOpenApp(RemoteMessage message) async {
    navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (context) =>
        const MainRecommendationsScreen())
    );
  }

  // Método para mostrar la notificación local
  static Future<void> showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'alerts_channel', // Debe ser el mismo que el ID del canal
      'Recomendaciones',
      channelDescription: 'Este canal se utiliza para notificaciones importantes relacionadas con el monitoreo de glucosa y presión arterial.',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      message.data.hashCode, // ID único para cada notificación
      message.notification?.title ?? 'Sin título', // Título de la notificación
      message.notification?.body ?? 'Sin contenido', // Cuerpo de la notificación
      platformChannelSpecifics, // Configuración para Android
    );
  }

  static Future initializeApp() async {
    if(Platform.isIOS) {
      await _initializeApp(
          const FirebaseOptions(
              apiKey: 'AIzaSyCsot9GcAw67dDgrF5lTrGe5eRK_A7tGFw',
              appId: '1:957069430236:ios:7b09fb0dec8d52bae4d319',
              messagingSenderId: '957069430236',
              projectId: 'vitaldm-97674'
          )
      );
    } else {
      await _initializeApp(
          const FirebaseOptions(
              apiKey: 'AIzaSyCI0MG63059R7doUrmF8W4jM5UaLw6eEWQ',
              appId: '1:509260553460:android:d6294c676f1e9933e952a1',
              messagingSenderId: '509260553460',
              projectId: 'plataforma-monitoreo-glucosa'
          )
      );
    }
  }

  static Future _initializeApp(FirebaseOptions options) async {

    // Push Notification
    await Firebase.initializeApp(options: options);

    // Inicializar notificaciones locales
    await initializeLocalNotifications();

    // Obtener token de FCM
    token = await FirebaseMessaging.instance.getToken();
    if(token == null){
      throw Exception('Error al obtener token');
    }
    await guardarFcmToken.call(token!);

    print('Token token token $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageOpenApp);

  }

}