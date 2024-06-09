import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/local/valor_glucosa_local_datasource.dart';
import 'package:app_plataforma/src/features/valor_presion/data/data_sources/remote/impl/valor_presion_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/valor_presion/data/data_sources/remote/valor_presion_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/mapper/valor_presion_mapper.dart';
import 'package:app_plataforma/src/features/valor_presion/data/repositories/valor_presion_adapter.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/repositories/valor_presion_repository.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/buscar_promedio_diastolica.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/buscar_promedio_sistolica.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/buscar_valores_presion_dia.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/capturar_valor_presion.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/ingresar_valor_presion.dart';
import 'package:app_plataforma/src/features/valor_presion/presentation/bloc/valor_presion_bloc.dart';
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
              local: sl<ValorGlucosaLocalDatasource>(),
              mapper: sl<ValorPresionMapper>()
          ),
      dependsOn: [ValorPresionRemoteDataSource, ValorGlucosaLocalDatasource, ValorPresionMapper]
  );

  /*  Use Cases   */
  sl.registerSingletonWithDependencies<BuscarValoresPresion>(
          () => BuscarValoresPresion(sl<ValorPresionRepository>()),
      dependsOn: [ValorPresionRepository]
  );

  sl.registerSingleton<CapturarValorPresion>(CapturarValorPresion(),
  );

  sl.registerSingletonWithDependencies<IngresarValorPresion>(
          () => IngresarValorPresion(sl<ValorPresionRepository>()),
      dependsOn: [ValorPresionRepository]
  );

  sl.registerSingletonWithDependencies<BuscarPromedioSistolica>(
          () => BuscarPromedioSistolica(sl<ValorPresionRepository>()),
      dependsOn: [ValorPresionRepository]
  );

  sl.registerSingletonWithDependencies<BuscarPromedioDiastolica>(
          () => BuscarPromedioDiastolica(sl<ValorPresionRepository>()),
      dependsOn: [ValorPresionRepository]
  );

  /*  Bloc  */
  sl.registerFactory<ValorPresionBloc>(
          () => ValorPresionBloc(
              buscarValoresDia: sl<BuscarValoresPresion>(),
              capturarValorPresion: sl<CapturarValorPresion>(),
              ingresarValorPresion: sl<IngresarValorPresion>(),
              buscarPromedioSistolica: sl<BuscarPromedioSistolica>(),
              buscarPromedioDiastolica: sl<BuscarPromedioDiastolica>()
          )
  );

}

// <>