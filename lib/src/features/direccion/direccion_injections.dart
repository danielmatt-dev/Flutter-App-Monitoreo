import 'package:app_plataforma/src/features/direccion/data/data_sources/remote/direccion_remote_datasource.dart.dart';
import 'package:app_plataforma/src/features/direccion/data/data_sources/remote/impl/direccion_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/direccion/data/models/mapper/direccion_mapper.dart';
import 'package:app_plataforma/src/features/direccion/data/models/mapper/direccion_mapper_impl.dart';
import 'package:app_plataforma/src/features/direccion/data/repositories/direccion_adapter.dart';
import 'package:app_plataforma/src/features/direccion/domain/repositories/direccion_repository.dart';
import 'package:app_plataforma/src/features/direccion/domain/usecases/actualizar_direccion.dart';
import 'package:app_plataforma/src/features/direccion/domain/usecases/buscar_direccion_usecase.dart';
import 'package:app_plataforma/src/features/direccion/presentation/bloc/direccion_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initDireccionInjections(){

  /*  Remote Datasource  */
  sl.registerSingleton<DireccionRemoteDatasource>(DireccionRemoteDatasourceImpl(sl()));

  /*  Mapper  */
  sl.registerSingleton<DireccionMapper>(DireccionMapperImpl());

  /*  Repository  */
  sl.registerSingleton<DireccionRepository>(
      DireccionAdapter(
          remote: sl(),
          local: sl(),
          mapper: sl()
      )
  );

  /*  Use Cases   */
  sl.registerSingleton<BuscarDireccionUseCase>(BuscarDireccionUseCase(sl()));

  sl.registerSingleton<ActualizarDireccion>(ActualizarDireccion(sl()));

  /*  Bloc  */
  sl.registerSingleton<DireccionBloc>(
      DireccionBloc(
          buscarDireccion: sl(),
          actualizarDireccion: sl()
      )
  );

}
