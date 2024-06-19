import 'package:app_plataforma/src/features/notificacion/data/data_sources/remote/impl/notificacion_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/notificacion/data/data_sources/remote/notificacion_remote_datasource.dart';
import 'package:app_plataforma/src/features/notificacion/data/models/mapper/notificacion_mapper.dart';
import 'package:app_plataforma/src/features/notificacion/data/repository/notificacion_adapter.dart';
import 'package:app_plataforma/src/features/notificacion/domain/repositories/notificacion_repository.dart';
import 'package:app_plataforma/src/features/notificacion/domain/usecases/buscar_notificacion_por_id.dart';
import 'package:app_plataforma/src/features/notificacion/domain/usecases/buscar_notificaciones.dart';
import 'package:app_plataforma/src/features/notificacion/domain/usecases/buscar_notificaciones_personales.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion/notificacion_bloc.dart';
import 'package:app_plataforma/src/features/notificacion/presentation/bloc/notificacion_personal/notificacion_personal_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

// <>
initNotificacionInjections(){

  /*  Remote Datasource  */
  sl.registerSingleton<NotificacionRemoteDataSource>(NotificacionRemoteDataSourceImpl(sl()));

  /*  Mapper  */
  sl.registerSingleton<NotificacionMapper>(NotificacionMapperImpl());

  /*  Repository  */
  sl.registerSingleton<NotificacionRepository>(
      NotificacionAdapter(
          remote: sl(),
          local: sl(),
          mapper: sl()
      )
  );

  /*  Use Cases   */
  sl.registerSingleton<BuscarNotificaciones>(BuscarNotificaciones(sl()));

  sl.registerSingleton<BuscarNotificacionPorId>(BuscarNotificacionPorId(sl()));

  sl.registerSingleton<BuscarNotificacionesPersonales>(BuscarNotificacionesPersonales(sl()));

  /*  Bloc  */
  sl.registerSingleton<NotificacionBloc>(
      NotificacionBloc(
          buscarNotificaciones: sl(),
          buscarNotificacionPorId: sl()
      )
  );

  sl.registerSingleton<NotificacionPersonalBloc>(
    NotificacionPersonalBloc(
        buscarNotificacionesPersonales: sl())
  );

}