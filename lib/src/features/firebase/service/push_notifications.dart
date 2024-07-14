import 'dart:async';

import 'package:app_plataforma/src/features/auth_response/domain/usecases/guardar_fcm_token.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/configuracion_local_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/configuracion_mediciones_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/*
class PushNotificationsImpl extends PushNotificationService {

  final ConfiguracionLocalDatasource localDatasource;
  final GuardarFcmToken guardarFcmToken;

  PushNotificationsImpl({
    required this.localDatasource,
    required this.guardarFcmToken
  });

  final FirebaseMessaging message = FirebaseMessaging.instance;
  late String? token;

  @override
  Future initializeApp() async {

    // Push Notification}
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

    final result =  await guardarFcmToken.call(token!);

    result.fold(
            (l) =>print(l.toString()),
            (r) => print('Token guardado')
    );

    print('Token token token $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage(onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(onOpenMessageHandler);
  }

  @override
  Future onBackgroundHandler(RemoteMessage message) async {
    String? title = message.notification?.title;

    if (title != null && title == 'Mediciones del día') {
      print('Mediciones');
      localDatasource.saveConfiguracion(ConfiguracionMedicionesModel.fromJson(message.data));
    }
  }

  @override
  Future onMessageHandler(RemoteMessage message) async {
    print('onMessage Hander: ${message.data}');
  }

  @override
  Future onOpenMessageHandler(RemoteMessage message) async {
    print('OnOpenMessageOpenApp Hander: ${message.data}');
  }

}

abstract class PushNotificationService {
  Future<void> initializeApp();
  Future<void> onBackgroundHandler(RemoteMessage message);
  Future<void> onMessageHandler(RemoteMessage message);
  Future<void> onOpenMessageHandler(RemoteMessage message);
}

 */
// <>