import 'package:app_plataforma/src/features/valor/data/data_sources/remote/impl/valor_glucosa_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/valor/data/data_sources/remote/impl/valor_presion_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/valor/data/data_sources/remote/valor_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor/data/models/mapper/valor_response_mapper_impl.dart';
import 'package:app_plataforma/src/features/valor/data/models/mapper/valor_mapper.dart';
import 'package:app_plataforma/src/features/valor/data/models/mapper/valor_response_mapper.dart';
import 'package:app_plataforma/src/features/valor/data/repositories/valor_glucosa_adapter.dart';
import 'package:app_plataforma/src/features/valor/data/repositories/valor_presion_adapter.dart';
import 'package:app_plataforma/src/features/valor/domain/repositories/valor_repository.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/glucosa/buscar_promedio_glucosa.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/glucosa/buscar_valores_glucosa_dia.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/glucosa/generar_pdf_glucosa.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/glucosa/ingresar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/presion/buscar_promedio_presion.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/presion/buscar_valores_presion_dia.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/presion/generar_pdf_presion.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/presion/ingresar_valor_presion.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/bloc/valor_bloc.dart';
import 'package:app_plataforma/src/features/valor/presentation/promedio/bloc/promedio_bloc.dart';
import 'package:app_plataforma/src/features/valor/presentation/reporte/cubit/reporte_cubit.dart';
import 'package:app_plataforma/src/features/valor/presentation/valor_response/bloc/valor_response_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

// <>
initValorInjections() {
  
  /*  Remote Datasource  */
  sl.registerSingleton<ValorRemoteDataSource>(
      ValorGlucosaRemoteDatasourceImpl(sl()),
    instanceName: 'ValorGlucosaRemote'
  );

  sl.registerSingleton<ValorRemoteDataSource>(
      ValorPresionRemoteDataSourceImpl(sl()),
    instanceName: 'ValorPresionRemote'
  );

  /*  Mapper  */
  sl.registerSingleton<ValorResponseMapper>(ValorResponseMapperImpl());
  sl.registerSingleton<ValorMapper>(ValorMapperImpl());

  /*  Repository  */
  sl.registerSingleton<ValorRepository>(
      ValorGlucosaAdapter(
          remote: sl(instanceName: 'ValorGlucosaRemote'),
          local: sl(),
          mapper: sl(),
          responseMapper: sl()
      ),
    instanceName: 'ValorGlucosaAdapter'
  );

  sl.registerSingleton<ValorRepository>(
      ValorPresionAdapter(
        remote: sl(instanceName: 'ValorPresionRemote'),
        local: sl(),
        mapper: sl(),
        responseMapper: sl(),
      ),
    instanceName: 'ValorPresionAdapter'
  );

  /*  Use Cases Glucosa  */
  sl.registerSingleton<IngresarValorGlucosa>(
      IngresarValorGlucosa(sl(instanceName: 'ValorGlucosaAdapter'))
  );

  sl.registerSingleton<BuscarValoresGlucosaDia>(
      BuscarValoresGlucosaDia(sl(instanceName: 'ValorGlucosaAdapter'))
  );

  sl.registerSingleton<GenerarPdfGlucosa>(GenerarPdfGlucosa(sl(instanceName: 'ValorGlucosaAdapter')));

  sl.registerSingleton<BuscarPromedioGlucosa>(BuscarPromedioGlucosa(sl(instanceName: 'ValorGlucosaAdapter')));

  /*  Use Cases Presión  */
  sl.registerSingleton<IngresarValorPresion>(
      IngresarValorPresion(sl(instanceName: 'ValorPresionAdapter'))
  );

  sl.registerSingleton<BuscarValoresPresion>(
      BuscarValoresPresion(sl(instanceName: 'ValorPresionAdapter'))
  );

  sl.registerSingleton<GenerarPdfPresion>(GenerarPdfPresion(sl(instanceName: 'ValorPresionAdapter')));

  sl.registerSingleton<BuscarPromedioPresion>(BuscarPromedioPresion(sl(instanceName: 'ValorPresionAdapter')));

  /*  Bloc  */
  sl.registerSingleton<ValorGlucosaBloc>(
      ValorGlucosaBloc(
          ingresarValorPresion: sl(),
          ingresarValorGlucosa: sl(),
      )
  );

  /*  Valor Response Bloc  */
  sl.registerSingleton<ValorResponseBloc>(
      ValorResponseBloc(
          buscarValoresGlucosa: sl(),
          buscarValoresPresion: sl()
      )
  );

  /*  Promedio Bloc  */
  sl.registerSingleton<PromedioBloc>(
      PromedioBloc(
          buscarPromedioGlucosa: sl(),
          buscarPromedioPresion: sl(),
      )
  );

  /* Reporte Cubit */
  sl.registerSingleton<ReporteCubit>(
      ReporteCubit(
          generarReporteGlucosa: sl(),
          generarPdfPresion: sl()
      )
  );

}