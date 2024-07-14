import 'dart:async';

import 'package:app_plataforma/src/features/auth_response/domain/usecases/guardar_fcm_token.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/configuracion_local_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/configuracion_mediciones_model.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/sqlf_injections.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// <>
class PushNotificationService {

  static final guardarFcmToken = sl<GuardarFcmToken>();

  static FirebaseMessaging message = FirebaseMessaging.instance;
  static String? token;

  static Future _backgroundHandler(RemoteMessage message) async {

    String? title = message.notification?.title;

    if(title != null && title == 'Mediciones del día') {

      print('GUARDANDO MEDICIONES');

      await initSqlfInyections();
      final localDatasource = sl<ConfiguracionLocalDatasource>();

      localDatasource.saveConfiguracion(ConfiguracionMedicionesModel.fromJson(message.data));

    }

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

    if(token == null){
      throw Exception('Error al obtener token');
    }

    final result = await guardarFcmToken.call(token!);

    result.fold(
            (l) => print(l.toString()),
            (r) => print('Token guardado')
    );

    print('Token token token $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageOpenApp);

    // Local Notification

  }

}