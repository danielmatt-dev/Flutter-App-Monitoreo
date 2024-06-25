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

// <>
initPreguntasInjections(){

  /*  Remote Datasource */
  sl.registerSingleton<PreguntaRemoteDatasource>(PreguntaRemoteDatasourceImpl(sl()));

  /*  Mapper  */
  sl.registerSingleton<RespuestaMapper>(RespuestaMapperImpl());

  sl.registerSingleton<PreguntaMapper>(PreguntaMapperImpl(sl<RespuestaMapper>())
  );

  /*  Repository  */
  sl.registerSingleton<PreguntaRepository>(
      PreguntaAdapter(
          remote: sl(),
          mapper: sl()
      )
  );

  /*  Use Cases  */
  sl.registerSingleton<BuscarPreguntas>(BuscarPreguntas(sl()));

  /*  Cubit  */
  sl.registerSingleton<PreguntasCubit>(PreguntasCubit(buscarPreguntas: sl()));

}