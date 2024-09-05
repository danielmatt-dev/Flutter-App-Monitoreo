import 'package:app_plataforma/src/features/comentario/data/data_sources/remote/comentario_remote_datasource.dart';
import 'package:app_plataforma/src/features/comentario/data/data_sources/remote/comentario_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/comentario/data/repositories/comentario_adapter.dart';
import 'package:app_plataforma/src/features/comentario/domain/repositories/comentario_repository.dart';
import 'package:app_plataforma/src/features/comentario/domain/usecases/guadar_comentario.dart';
import 'package:app_plataforma/src/features/comentario/presentation/cubit/comentario_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initComentarioInjections() {

  /* Remote Datasource */
  sl.registerSingleton<ComentarioRemoteDatasource>(
    ComentarioRemoteDatasourceImpl(sl()),
  );

  /* Repository */
  sl.registerSingleton<ComentarioRepository>(
    ComentarioAdapter(sl(), sl()),
  );

  /* Use Cases */
  sl.registerSingleton<GuardarComentario>(
    GuardarComentario(sl()),
  );

  /* Cubit */
  sl.registerSingleton<ComentarioCubit>(
    ComentarioCubit(guardarComentario: sl()),
  );

}