import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/remote/impl/registro_respuestas_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/remote/registro_respuestas_remote_datasource.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/repositories/registro_respuestas_adapter.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/repositories/registro_respuestas_repository.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/guardar_respuesta_lista.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/guardar_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/obtener_lista_registros.dart';
import 'package:app_plataforma/src/features/registro_respuestas/presentation/cubit/registro_respuestas_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:dio/dio.dart';

// <>
initRegistroRespuestasInjections(){

  /*  Remote Datasource  */
  sl.registerLazySingleton<RegistroRespuestasRemoteDatasource>(
          () => RegistroRespuestasRemoteDatasourceImpl(sl<Dio>())
  );

  /*  Repository  */
  sl.registerLazySingleton<RegistroRespuestasRepository>(
          () => RegistroRespuestasAdapter(
              remote: sl<RegistroRespuestasRemoteDatasource>(),
              repository: sl<AuthRepository>()
          )
  );

  /*  Use Cases  */
  sl.registerLazySingleton<GuardarRespuestaEnLista>(
          () => GuardarRespuestaEnLista(sl<RegistroRespuestasRepository>()
          )
  );

  sl.registerLazySingleton<ObtenerListaRegistros>(
          () => ObtenerListaRegistros(
              repository: sl<RegistroRespuestasRepository>()
          )
  );

  sl.registerLazySingleton<GuardarRespuestas>(
          () => GuardarRespuestas(sl<RegistroRespuestasRepository>())
  );

  /*  Cubit  */
  sl.registerFactory<RegistroRespuestasCubit>(
          () => RegistroRespuestasCubit(
              guardarRespuestaLista: sl<GuardarRespuestaEnLista>(),
              guardarRespuestas: sl<GuardarRespuestas>(),
              obtenerListaRespuestas: sl<ObtenerListaRegistros>()
          )
  );

}