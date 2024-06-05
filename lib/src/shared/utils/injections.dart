import 'package:app_plataforma/src/features/notificacion/notificacion_injections.dart';
import 'package:app_plataforma/src/features/paciente/paciente_injections.dart';
import 'package:app_plataforma/src/features/valor_glucosa/valor_glucosa_injections.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

/*  Dio  */
final slDio = sl.registerSingleton<Dio>(Dio());

Future<void> initInjections() async {
  initNotificacionInjections();
  initPacienteInjections();
  initValorGlucosaInjections();
}