import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/sqflite/configuracion_local_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/sqflite/impl/configuracion_local_datasource_impl.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/sqflite/impl/mediciones_helper.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/remote/configuracion_remote_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/remote/impl/configuracion_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/mapper/configuracion_mediciones_mapper.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/repositories/configuracion_mediciones_adapter.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/repositories/configuracion_mediciones_repository.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/usecases/buscar_mediciones_del_dia.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:dio/dio.dart';

initConfiguracionMedicionesInjections(){

  /*  Remote Datasource  */
  sl.registerSingleton<ConfiguracionRemoteDatasource>(ConfiguracionRemoteDatasourceImpl(sl<Dio>()));

  /*  Local Datasource  */
  sl.registerSingleton<ConfiguracionLocalDatasource>(ConfiguracionLocalDatasourceImpl(sl<MedicionesHelper>()));

  /*  Mapper   */

  /*  Repository  */
  sl.registerSingletonWithDependencies<ConfiguracionMedicionesRepository>(
          () => ConfiguracionMedicionesAdapter(
              remote: sl<ConfiguracionRemoteDatasource>(),
              local: sl<ConfiguracionLocalDatasource>(),
              repository: sl<AuthRepository>(),
              mapper: sl<ConfiguracionMedicionesMapper>()
          )
  );

  /*  Use Cases  */
  sl.registerSingleton<BuscarMedicionesDelDia>(
      BuscarMedicionesDelDia(sl<ConfiguracionMedicionesRepository>())
  );

}

/*  Remote Datasource  */

/*  Repository  */

/*  Use Cases  */

/*  Cubit  */
