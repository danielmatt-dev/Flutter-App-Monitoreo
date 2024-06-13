import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/impl/valor_glucosa_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/valor_glucosa_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/repositories/valor_glucosa_adapter.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/capturar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/ingresar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor_glucosa/presentation/bloc/valor_glucosa_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

// <>
initValorGlucosaInjections() {
  
  /*  Remote Datasource  */
  sl.registerSingleton<ValorGlucosaRemoteDataSource>(ValorGlucosaRemoteDatasourceImpl(sl()));

  /*  Repository  */
  sl.registerSingleton<ValorGlucosaRepository>(
      ValorGlucosaAdapter(
        remote: sl(),
        local: sl(),
        mapper: sl()
      )
  );

  /*  Use Cases  */

  sl.registerSingleton<IngresarValorGlucosa>(IngresarValorGlucosa(sl()));

  sl.registerSingleton<CapturarValorGlucosa>(CapturarValorGlucosa());

  /*  Bloc  */
  sl.registerSingleton<ValorGlucosaBloc>(
      ValorGlucosaBloc(
          capturarValorGlucosa: sl(),
          ingresarValorGlucosa: sl(),
      )
  );

}