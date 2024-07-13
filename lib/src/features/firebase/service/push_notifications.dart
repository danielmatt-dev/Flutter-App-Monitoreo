import 'dart:async';

import 'package:app_plataforma/src/features/auth_response/domain/usecases/guardar_fcm_token.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/configuracion_local_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/configuracion_mediciones_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsImpl extends PushNotifications {

  final ConfiguracionLocalDatasource localDatasource;
  final GuardarFcmToken guardarFcmToken;

  PushNotificationsImpl({
    required this.localDatasource,
    required this.guardarFcmToken
  });

  final FirebaseMessaging message = FirebaseMessaging.instance;
  late String? token;

  @override
  Future inicializeApp() async {

    // Push Notification


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
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageOpenApp);
  }

  @override
  Future _backgroundHandler(RemoteMessage message) async {
    String? title = message.notification?.title;

    if (title != null && title == 'Mediciones del día') {
      print('Mediciones');
      localDatasource.saveConfiguracion(ConfiguracionMedicionesModel.fromJson(message.data));
    }
  }

  @override
  Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage Hander: ${message.data}');
  }

  @override
  Future _onOpenMessageOpenApp(RemoteMessage message) async {
    print('OnOpenMessageOpenApp Hander: ${message.data}');
  }

}

abstract class PushNotifications {

  Future inicializeApp();

  Future _backgroundHandler(RemoteMessage message);

  Future _onMessageHandler(RemoteMessage message);

  Future _onOpenMessageOpenApp(RemoteMessage message);

}

// <>