import 'package:app_plataforma/src/core/theme/theme_injections.dart';
import 'package:app_plataforma/src/features/auth_response/auth_response_injections.dart';
import 'package:app_plataforma/src/features/mediciones/medicion_injections.dart';
import 'package:app_plataforma/src/features/direccion/direccion_injections.dart';
import 'package:app_plataforma/src/features/notificacion/notificacion_injections.dart';
import 'package:app_plataforma/src/features/paciente/paciente_injections.dart';
import 'package:app_plataforma/src/features/preguntas/preguntas_injections.dart';
import 'package:app_plataforma/src/features/registro_respuestas/registro_respuestas_injections.dart';
import 'package:app_plataforma/src/features/tratamiento/tratamiento_injections.dart';
import 'package:app_plataforma/src/features/valor/valor_injections.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

initInjections() async {

  /*  Dio  */
  sl.registerSingleton<Dio>(Dio());

  /*  Shared Preferences  */
  sl.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  await initAuthResponseInjections();
  await initMedicionInjections();
  await initThemeInjections();
  await initNotificacionInjections();
  await initValorInjections();
  await initPacienteInjections();
  await initDireccionInjections();
  await initPreguntasInjections();
  await initRegistroRespuestasInjections();
  await initTratamientoInjections();

}