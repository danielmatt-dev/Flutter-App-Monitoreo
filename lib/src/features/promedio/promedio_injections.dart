import 'package:app_plataforma/src/features/promedio/data/data_sources/remote/impl/promedio_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/promedio/data/data_sources/remote/promedio_remote_datasource.dart';
import 'package:app_plataforma/src/features/promedio/data/models/mapper/promedio_mapper.dart';
import 'package:app_plataforma/src/features/promedio/data/repositories/promedio_adapter.dart';
import 'package:app_plataforma/src/features/promedio/domain/repositories/promedio_repository.dart';
import 'package:app_plataforma/src/features/promedio/domain/usecases/buscar_promedio_diastolica.dart';
import 'package:app_plataforma/src/features/promedio/domain/usecases/buscar_promedio_glucosa.dart';
import 'package:app_plataforma/src/features/promedio/domain/usecases/buscar_promedio_sistolica.dart';
import 'package:app_plataforma/src/features/promedio/presentation/bloc/promedio_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initPromedioInjectios() {

  /*  Remote Datasource  */
  sl.registerSingleton<PromedioRemoteDatasource>(PromedioRemoteDatasourceImpl(sl()));

  /*  Mapper  */
  sl.registerSingleton<PromedioMapper>(PromedioMapperImpl());

  /*  Repository  */
  sl.registerSingleton<PromedioRepository>(PromedioAdapter(remote: sl(), local: sl(), mapper: sl()));

  /*  Use Cases */
  sl.registerSingleton<BuscarPromedioGlucosa>(BuscarPromedioGlucosa(sl()));

  sl.registerSingleton<BuscarPromedioSistolica>(BuscarPromedioSistolica(sl()));

  sl.registerSingleton<BuscarPromedioDiastolica>(BuscarPromedioDiastolica(sl()),);

  /*  Bloc  */
  sl.registerSingleton<PromedioBloc>(
      PromedioBloc(
          buscarPromedioGlucosa: sl(),
          buscarPromedioSistolica: sl(),
          buscarPromedioDiastolica: sl()
      )
  );

}