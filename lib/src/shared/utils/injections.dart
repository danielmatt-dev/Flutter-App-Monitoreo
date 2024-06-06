import 'package:app_plataforma/src/features/notificacion/notificacion_injections.dart';
import 'package:app_plataforma/src/features/paciente/paciente_injections.dart';
import 'package:app_plataforma/src/features/valor_glucosa/valor_glucosa_injections.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {

  /*  Dio  */
  sl.registerSingleton<Dio>(Dio());

  /*  Shared Preferences  */
  sl.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

  initNotificacionInjections();
  initPacienteInjections();
  initValorGlucosaInjections();

}