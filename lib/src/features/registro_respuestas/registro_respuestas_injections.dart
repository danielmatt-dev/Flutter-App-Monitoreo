import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/remote/impl/registro_respuestas_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/remote/registro_respuestas_remote_datasource.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/models/mapper/registro_respuestas_mapper.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/repositories/registro_respuestas_adapter.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/repositories/registro_respuestas_repository.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/guardar_respuesta_lista.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/guardar_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/presentation/cubit/registro_respuestas_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

// <>
Future<void> initRegistroRespuestasInjections() async {

  /*  Remote Datasource  */
  sl.registerSingleton<RegistroRespuestasRemoteDatasource>(
      RegistroRespuestasRemoteDatasourceImpl(sl())
  );

  /*  Mapper  */
  sl.registerSingleton<RegistroRespuestasMapper>(
      RegistroRespuestasMapperImpl()
  );

  /*  Repository  */
  sl.registerSingleton<RegistroRespuestasRepository>(
      RegistroRespuestasAdapter(
        remote: sl(),
        local: sl(),
        mapper: sl(),
      )
  );

  /*  Use Cases  */
  sl.registerSingleton<GuardarRespuestaEnLista>(
      GuardarRespuestaEnLista(sl())
  );

  sl.registerSingleton<GuardarRespuestas>(
      GuardarRespuestas(sl())
  );

  /*  Cubit  */
  sl.registerSingleton<RegistroRespuestasCubit>(
      RegistroRespuestasCubit(
        guardarRespuestaLista: sl(),
        guardarRespuestas: sl(),
      )
  );

}