import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/impl/configuracion_local_datasource_impl.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/configuracion_local_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/sqflite/mediciones_helper.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/remote/configuracion_remote_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/remote/impl/configuracion_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/mapper/configuracion_mediciones_mapper.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/repositories/configuracion_mediciones_adapter.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/repositories/configuracion_mediciones_repository.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/usecases/buscar_mediciones_del_dia.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/usecases/guardar_mediciones.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/usecases/guardar_mediciones_del_dia.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initConfiguracionMedicionesInjections() {

  // Registra Remote Datasource
  sl.registerSingleton<ConfiguracionRemoteDatasource>(
      ConfiguracionRemoteDatasourceImpl(sl()),
  );

  // Registra Mapper
  sl.registerSingleton<ConfiguracionMedicionesMapper>(ConfiguracionMedicionesMapperImpl());

  // Registra Repository
  sl.registerSingleton<ConfiguracionMedicionesRepository>(
    ConfiguracionMedicionesAdapter(
      remote: sl(),
      local: sl(),
      repository: sl(),
      mapper: sl(),
    ),
  );

  // Registra Use Cases
  sl.registerSingleton<BuscarMedicionesDelDia>(
    BuscarMedicionesDelDia(sl()),
  );

  /*
  sl.registerSingleton<GuardarMedicionesDelDia>(
      GuardarMedicionesDelDia(repository: sl())
  );
   */

  sl.registerSingleton<GuardarMediciones>(
      GuardarMediciones(sl())
  );

}

/*  Remote Datasource  */

/*  Repository  */

/*  Use Cases  */

/*  Cubit  */
