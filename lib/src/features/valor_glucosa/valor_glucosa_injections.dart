import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/impl/valor_glucosa_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/valor_glucosa_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/mapper/valor_glucosa_mapper.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/buscar_promedio_glucosa.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/buscar_valores_glucosa_dia.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/capturar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/usecases/ingresar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor_glucosa/presentation/bloc/valor_glucosa_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

// <>
initValorGlucosaInjections() {
  
  /*  Remote Datasource  */
  sl.registerSingleton<ValorGlucosaRemoteDataSource>(ValorGlucosaRemoteDatasourceImpl(sl()));

  /*  Mapper  */
  sl.registerSingleton<ValorGlucosaMapper>(ValorGlucosaMapperImpl());
  
  /*  Repository  */
  sl.registerSingleton<ValorGlucosaRepository>(sl());
  
  /*  Use Cases  */
  sl.registerSingleton<BuscarValoresGlucosaDia>(sl());

  sl.registerSingletonWithDependencies<IngresarValorGlucosa>(sl());

  sl.registerSingleton<CapturarValorGlucosa>(CapturarValorGlucosa());

  sl.registerSingleton<BuscarPromedioGlucosa>(sl());

  /*  Bloc  */
  sl.registerSingleton<ValorGlucosaBloc>(sl());

}