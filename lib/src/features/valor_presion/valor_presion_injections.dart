import 'package:app_plataforma/src/features/paciente/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/valor_presion/data/data_sources/remote/impl/valor_presion_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/valor_presion/data/data_sources/remote/valor_presion_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/mapper/valor_presion_mapper.dart';
import 'package:app_plataforma/src/features/valor_presion/data/repositories/valor_presion_adapter.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/repositories/valor_presion_repository.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/buscar_valores_presion_dia.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/capturar_valor_presion.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/ingresar_valor_presion.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:dio/dio.dart';

initValorPresionInjections() {

  /*  Remote Datasource */
  sl.registerSingleton<ValorPresionRemoteDataSource>(ValorPresionRemoteDataSourceImpl(sl<Dio>()));

  /*  Mapper  */
  sl.registerSingleton<ValorPresionMapper>(ValorPresionMapperImpl());

  /*  Repository  */
  sl.registerSingletonWithDependencies<ValorPresionRepository>(
          () => ValorPresionAdapter(
              remote: sl<ValorPresionRemoteDataSource>(),
              mapper: sl<ValorPresionMapper>()
          ),
      dependsOn: [ValorPresionRemoteDataSource, ValorPresionMapper]
  );

  /*  Use Cases   */
  sl.registerSingletonWithDependencies<BuscarValoresPresion>(
          () => BuscarValoresPresion(sl<ValorPresionRepository>()),
      dependsOn: [ValorPresionRepository]
  );

  sl.registerSingletonWithDependencies<CapturarValorPresion>(
          () => CapturarValorPresion(sl<AuthLocalDatasource>()),
      dependsOn: [AuthLocalDatasource]
  );

  sl.registerSingletonWithDependencies<IngresarValorPresion>(
          () => IngresarValorPresion(sl<ValorPresionRepository>()),
  dependsOn: [ValorPresionRepository]
  );

  /*  Bloc  */
  

}

// <>