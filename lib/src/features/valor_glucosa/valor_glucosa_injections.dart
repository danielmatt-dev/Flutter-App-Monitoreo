import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/impl/valor_glucosa_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/valor_glucosa_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/mapper/valor_glucosa_mapper.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/repositories/valor_glucosa_adapter.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/buscar_valores_dia.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/capturar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/ingresar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor_glucosa/presentation/bloc/valor_glucosa_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:dio/dio.dart';

// <>
initValorGlucosaInjections(){
  
  /*  Remote Datasource  */
  sl.registerSingleton<ValorGlucosaRemoteDataSource>(ValorGlucosaRemoteDatasourceImpl(sl<Dio>()));
  
  /*  Mapper  */
  sl.registerSingleton<ValorGlucosaMapper>(ValorGlucosaMapperImpl());
  
  /*  Repository  */
  sl.registerSingletonWithDependencies<ValorGlucosaRepository>(
      () => ValorGlucosaAdapter(
          remote: sl<ValorGlucosaRemoteDataSource>(),
          mapper: sl<ValorGlucosaMapper>()),
    dependsOn: [ValorGlucosaRemoteDataSource, ValorGlucosaMapper]
  );
  
  /*  Use Cases  */
  sl.registerSingletonWithDependencies<BuscarValoresDia>(
          () => BuscarValoresDia(sl<ValorGlucosaRepository>()),
    dependsOn: [ValorGlucosaRepository]
  );

  sl.registerSingletonWithDependencies<IngresarValorGlucosa>(
          () => IngresarValorGlucosa(sl<ValorGlucosaRepository>()),
    dependsOn: [ValorGlucosaRepository]
  );

  sl.registerSingleton<CapturarValorGlucosa>(CapturarValorGlucosa());

  /*  Bloc  */
  sl.registerFactory<ValorGlucosaBloc>(
          () => ValorGlucosaBloc(
              buscarValoresDia: sl<BuscarValoresDia>(),
              capturarValorGlucosa: sl<CapturarValorGlucosa>(),
              ingresarValorGlucosa: sl<IngresarValorGlucosa>()
          )
  );

}