import 'package:app_plataforma/src/core/theme/theme_injections.dart';
import 'package:app_plataforma/src/features/auth_response/auth_response_injections.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/sqflite/impl/mediciones_helper.dart';
import 'package:app_plataforma/src/features/direccion/direccion_injections.dart';
import 'package:app_plataforma/src/features/notificacion/notificacion_injections.dart';
import 'package:app_plataforma/src/features/paciente/paciente_injections.dart';
import 'package:app_plataforma/src/features/preguntas/preguntas_injections.dart';
import 'package:app_plataforma/src/features/promedio/promedio_injections.dart';
import 'package:app_plataforma/src/features/registro_respuestas/registro_respuestas_injections.dart';
import 'package:app_plataforma/src/features/valor_glucosa/valor_glucosa_injections.dart';
import 'package:app_plataforma/src/features/valor_pdf/pdf_injections.dart';
import 'package:app_plataforma/src/features/valor_presion/valor_presion_injections.dart';
import 'package:app_plataforma/src/features/valor_response/domain/entities/mapper/valor_response_mapper.dart';
import 'package:app_plataforma/src/features/valor_response/domain/entities/mapper/valor_response_mapper_impl.dart';
import 'package:app_plataforma/src/features/valor_response/valor_response_injections.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {

  /*  Dio  */
  sl.registerSingleton<Dio>(Dio());

  /*  Shared Preferences  */
  sl.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

  /*  Sqflite  */
  sl.registerSingleton<MedicionesHelper>(MedicionesHelper.instance);

  /*  Mapper  */
  sl.registerSingleton<ValorResponseMapper>(ValorResponseMapperImpl());

  await initThemeInjections();
  await initAuthResponseInjections();
  await initNotificacionInjections();

  await initValorGlucosaInjections();
  await initValorPresionInjections();
  await initPromedioInjectios();
  await initValorResponseInjections();
  await initPacienteInjections();
  await initPdfInjections();
  await initDireccionInjections();
  await initPreguntasInjections();
  await initRegistroRespuestasInjections();

  /*

  initPacienteInjections();
  initConfiguracionMedicionesInjections();
   */

}