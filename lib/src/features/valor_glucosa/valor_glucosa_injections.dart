import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/impl/valor_glucosa_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/valor_glucosa_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/mapper/valor_glucosa_mapper.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/repositories/valor_glucosa_adapter.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/buscar_promedio_glucosa.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/buscar_valores_glucosa_dia.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/capturar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/ingresar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor_glucosa/presentation/bloc/valor_glucosa_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:dio/dio.dart';

// <>
Future<void> initValorGlucosaInjections() async {
  
  /*  Remote Datasource  */
  sl.registerSingleton<ValorGlucosaRemoteDataSource>(ValorGlucosaRemoteDatasourceImpl(sl<Dio>()));

  /*  Mapper  */
  sl.registerSingleton<ValorGlucosaMapper>(ValorGlucosaMapperImpl());
  
  /*  Repository  */
  sl.registerSingletonWithDependencies<ValorGlucosaRepository>(
      () => ValorGlucosaAdapter(
          remote: sl<ValorGlucosaRemoteDataSource>(),
          local: sl<AuthRepository>(),
          mapper: sl<ValorGlucosaMapper>()),
    dependsOn: [ValorGlucosaRemoteDataSource, AuthRepository, ValorGlucosaMapper]
  );
  
  /*  Use Cases  */
  sl.registerSingletonWithDependencies<BuscarValoresGlucosaDia>(
          () => BuscarValoresGlucosaDia(sl<ValorGlucosaRepository>()),
    dependsOn: [ValorGlucosaRepository]
  );

  sl.registerSingletonWithDependencies<IngresarValorGlucosa>(
          () => IngresarValorGlucosa(sl<ValorGlucosaRepository>()),
    dependsOn: [ValorGlucosaRepository]
  );

  sl.registerSingleton<CapturarValorGlucosa>(CapturarValorGlucosa());

  sl.registerSingletonWithDependencies<BuscarPromedioGlucosa>(
          () => BuscarPromedioGlucosa(sl<ValorGlucosaRepository>()),
      dependsOn: [ValorGlucosaRepository]
  );

  /*  Bloc  */
  sl.registerFactory<ValorGlucosaBloc>(
          () => ValorGlucosaBloc(
              buscarValoresDia: sl<BuscarValoresGlucosaDia>(),
              capturarValorGlucosa: sl<CapturarValorGlucosa>(),
              ingresarValorGlucosa: sl<IngresarValorGlucosa>(),
              buscarPromedioGlucosa: sl<BuscarPromedioGlucosa>()
          )
  );

}