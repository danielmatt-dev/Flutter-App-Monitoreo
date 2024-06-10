import 'package:app_plataforma/src/features/preguntas/data/data_sources/remote/impl/pregunta_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/preguntas/data/data_sources/remote/pregunta_remote_datasource.dart';
import 'package:app_plataforma/src/features/preguntas/data/models/mapper/impl/pregunta_mapper_impl.dart';
import 'package:app_plataforma/src/features/preguntas/data/models/mapper/pregunta_mapper.dart';
import 'package:app_plataforma/src/features/preguntas/data/models/mapper/respuesta_mapper.dart';
import 'package:app_plataforma/src/features/preguntas/data/repositories/pregunta_adapter.dart';
import 'package:app_plataforma/src/features/preguntas/domain/repositories/pregunta_repository.dart';
import 'package:app_plataforma/src/features/preguntas/domain/usecases/buscar_preguntas.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/cubit/preguntas_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:dio/dio.dart';

// <>
initPreguntasInjections(){

  /*  Remote Datasource */
  sl.registerLazySingleton<PreguntaRemoteDatasource>(() => PreguntaRemoteDatasourceImpl(sl<Dio>()));

  /*  Mapper  */
  sl.registerLazySingleton<RespuestaMapper>(() => RespuestaMapperImpl());

  sl.registerLazySingleton<PreguntaMapper>(
          () => PreguntaMapperImpl(sl<RespuestaMapper>())
  );

  /*  Repository  */
  sl.registerLazySingleton<PreguntaRepository>(
          () => PreguntaAdapter(
              remote: sl<PreguntaRemoteDatasource>(),
              mapper: sl<PreguntaMapper>()
          )
  );

  /*  Use Cases  */
  sl.registerLazySingleton<BuscarPreguntas>(
          () => BuscarPreguntas(sl<PreguntaRepository>())
  );

  /*  Bloc  */
  sl.registerFactory<PreguntasCubit>(
          () => PreguntasCubit(
              buscarPreguntas: sl<BuscarPreguntas>()
          )
  );

}