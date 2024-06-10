import 'package:app_plataforma/src/features/auth_response/data/data_sources/local/auth_local_datasource.dart';
import 'package:app_plataforma/src/features/auth_response/data/data_sources/local/impl/auth_local_datasource_impl.dart';
import 'package:app_plataforma/src/features/auth_response/data/models/mapper/auth_response_mapper.dart';
import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/impl/paciente_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/paciente_remote_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/models/mapper/paciente_mapper.dart';
import 'package:app_plataforma/src/features/paciente/data/repositories/paciente_adapter.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/actualizar_paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/crear_paciente_update.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// <>
initPacienteInjections(){

  /*  Remote Datasource  */
  sl.registerSingleton<PacienteRemoteDatasource>(PacienteRemoteDatasourceImpl(sl<Dio>()));

  /*  Local Datasource  */
  sl.registerSingleton<AuthLocalDatasource>(AuthLocalDatasourceImpl(sl<SharedPreferences>()));

  /*  Mapper  */
  sl.registerSingleton<PacienteMapper>(PacienteMapperImpl());

  /*  Repository  */
  sl.registerSingletonWithDependencies<PacienteRepository>(
          () => PacienteAdapter(
              remote: sl<PacienteRemoteDatasource>(),
              local: sl<AuthRepository>(),
              mapper: sl<PacienteMapper>(),
              authMapper: sl<AuthResponseMapper>()
          ),
      dependsOn: [PacienteRemoteDatasource, AuthRepository, PacienteMapper, AuthResponseMapper]
  );

  /*  Use Cases  */
  sl.registerSingletonWithDependencies(
          () => BuscarPaciente(sl<PacienteRepository>()),
      dependsOn: [PacienteRepository]
  );

  sl.registerSingleton<CrearPacienteUpdate>(CrearPacienteUpdate());

  sl.registerSingletonWithDependencies<ActualizarPaciente>(
          () => ActualizarPaciente(sl<PacienteRepository>()),
      dependsOn: [PacienteRepository]
  );

  /*  Bloc  */
  sl.registerFactory<PacienteBloc>(
          () => PacienteBloc(buscarPacientePorId: sl<BuscarPaciente>())
  );

}