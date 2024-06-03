import 'package:app_plataforma/src/features/notificacion/data/data_sources/remote/impl/notificacion_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/notificacion/data/data_sources/remote/notificacion_remote_datasource.dart';
import 'package:app_plataforma/src/features/notificacion/data/models/mapper/notificacion_mapper.dart';
import 'package:app_plataforma/src/features/notificacion/data/repository/notificacion_adapter.dart';
import 'package:app_plataforma/src/features/notificacion/domain/repositories/notificacion_repository.dart';
import 'package:app_plataforma/src/features/notificacion/domain/usecases/buscar_notificacion_por_id.dart';
import 'package:app_plataforma/src/features/notificacion/domain/usecases/buscar_notificaciones.dart';
import 'package:dio/dio.dart';
import '../../shared/utils/injections.dart';

initNotificacionInjections(){

  /*  Dio  */
  sl.registerSingleton<Dio>(Dio());

  /*  Remote Datasource  */
  sl.registerSingleton<NotificacionRemoteDataSource>(NotificacionRemoteDataSourceImpl(sl<Dio>()));

  /*  Mapper  */
  sl.registerSingleton<NotificacionMapper>(NotificacionMapperImpl());

  /*  Repository  */
  sl.registerSingletonWithDependencies<NotificacionRepository>(
        () => NotificacionAdapter(
      remote: sl<NotificacionRemoteDataSource>(),
      mapper: sl<NotificacionMapper>(),
    ),
    dependsOn: [NotificacionRemoteDataSource, NotificacionMapper],
  );

  /*  Use Cases   */
  sl.registerSingletonWithDependencies<BuscarNotificaciones>(
          () => BuscarNotificaciones(sl<NotificacionRepository>()
          ),
  dependsOn: [NotificacionRepository]
  );

  sl.registerSingletonWithDependencies<BuscarNotificacionPorId>(
          () =>BuscarNotificacionPorId(sl<NotificacionRepository>()),
    dependsOn: [NotificacionRepository]
  );

}