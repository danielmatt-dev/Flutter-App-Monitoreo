import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
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
  sl.registerSingleton<ValorPresionRemoteDataSource>(ValorPresionRemoteDataSourceImpl(sl()));

  /*  Mapper  */
  sl.registerSingleton<ValorPresionMapper>(ValorPresionMapperImpl());

  /*  Repository  */
  sl.registerSingleton<ValorPresionRepository>(
      ValorPresionAdapter(
          remote: sl(),
          local: sl(),
          mapper: sl(),
          averageMapper: sl()
      )
  );

  /*  Use Cases   */
  sl.registerSingleton<BuscarValoresPresion>(BuscarValoresPresion(sl()),);

  sl.registerSingleton<CapturarValorPresion>(CapturarValorPresion());

  sl.registerSingleton<IngresarValorPresion>(IngresarValorPresion(sl()));

  sl.registerSingleton<BuscarPromedioSistolica>(BuscarPromedioSistolica(sl()));

  sl.registerSingleton<BuscarPromedioDiastolica>(BuscarPromedioDiastolica(sl()),);

  /*  Bloc  */
  sl.registerSingleton<ValorPresionBloc>(
      ValorPresionBloc(
              buscarValoresDia: sl(),
              capturarValorPresion: sl(),
              ingresarValorPresion: sl(),
              buscarPromedioSistolica: sl(),
              buscarPromedioDiastolica: sl()
          )
  );

}

// <>