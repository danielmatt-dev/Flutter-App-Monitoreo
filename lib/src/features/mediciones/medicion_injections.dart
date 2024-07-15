import 'package:app_plataforma/src/features/mediciones/data/data_sources/remote/impl/medicion_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/mediciones/data/data_sources/remote/medicion_remote_datasource.dart';
import 'package:app_plataforma/src/features/mediciones/data/models/mapper/medicion_mapper.dart';
import 'package:app_plataforma/src/features/mediciones/data/repositories/medicion_adapter.dart';
import 'package:app_plataforma/src/features/mediciones/domain/repositories/medicion_repository.dart';
import 'package:app_plataforma/src/features/mediciones/domain/usecases/buscar_mediciones_del_dia.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';


initMedicionInjections() {

  // Registra Remote Datasource
  sl.registerSingleton<MedicionRemoteDatasource>(
    MedicionRemoteDatasourceImpl(sl()),
  );

  sl.registerSingleton<MedicionMapper>(MedicionMapperImpl());
  
  // Registra Repository
  sl.registerSingleton<MedicionRepository>(
    MedicionAdapter(
      remote: sl(),
      repository: sl(),
      mapper: sl(),
    ),
  );

  // Registra Use Cases
  sl.registerSingleton<BuscarMedicionesDelDia>(
    BuscarMedicionesDelDia(sl()),
  );

}

/*  Remote Datasource  */

/*  Repository  */

/*  Use Cases  */

/*  Cubit  */
