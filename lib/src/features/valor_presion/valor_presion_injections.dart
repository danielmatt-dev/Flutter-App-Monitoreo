import 'package:app_plataforma/src/features/valor_presion/data/data_sources/remote/impl/valor_presion_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/valor_presion/data/data_sources/remote/valor_presion_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_presion/data/repositories/valor_presion_adapter.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/repositories/valor_presion_repository.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/capturar_valor_presion.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/usecases/ingresar_valor_presion.dart';
import 'package:app_plataforma/src/features/valor_presion/presentation/bloc/valor_presion_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initValorPresionInjections() {

  /*  Remote Datasource */
  sl.registerSingleton<ValorPresionRemoteDataSource>(ValorPresionRemoteDataSourceImpl(sl()));

  /*  Repository  */
  sl.registerSingleton<ValorPresionRepository>(
      ValorPresionAdapter(
          remote: sl(),
          local: sl(),
          mapper: sl()
      )
  );

  /*  Use Cases   */
  sl.registerSingleton<CapturarValorPresion>(CapturarValorPresion());

  sl.registerSingleton<IngresarValorPresion>(IngresarValorPresion(sl()));

  /*  Bloc  */
  sl.registerSingleton<ValorPresionBloc>(
      ValorPresionBloc(
              capturarValorPresion: sl(),
              ingresarValorPresion: sl()
          )
  );

}

// <>