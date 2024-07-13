import 'package:app_plataforma/src/core/theme/theme_injections.dart';
import 'package:app_plataforma/src/features/auth_response/auth_response_injections.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/configuracion_mediciones_injections.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/sqflite/mediciones_helper.dart';
import 'package:app_plataforma/src/features/direccion/direccion_injections.dart';
import 'package:app_plataforma/src/features/notificacion/notificacion_injections.dart';
import 'package:app_plataforma/src/features/paciente/paciente_injections.dart';
import 'package:app_plataforma/src/features/preguntas/preguntas_injections.dart';
import 'package:app_plataforma/src/features/registro_respuestas/registro_respuestas_injections.dart';
import 'package:app_plataforma/src/features/valor/valor_injections.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {

  /*  Dio  */
  sl.registerSingleton<Dio>(Dio());

  /*  Shared Preferences  */
  sl.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  /*  Sqflite  */
  sl.registerSingleton<MedicionesHelper>(MedicionesHelper.instance);

  await initAuthResponseInjections();
  await initConfiguracionMedicionesInjections();
  await initThemeInjections();
  await initNotificacionInjections();
  await initValorInjections();
  await initPacienteInjections();
  await initDireccionInjections();
  await initPreguntasInjections();
  await initRegistroRespuestasInjections();

}