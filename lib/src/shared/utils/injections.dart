import 'package:app_plataforma/src/features/notificacion/notificacion_injections.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  initNotificacionInjections();
}