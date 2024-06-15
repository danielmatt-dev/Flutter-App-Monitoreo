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
import 'package:app_plataforma/src/features/paciente/domain/usecases/actualizar_password.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/crear_cuenta.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/iniciar_sesion.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// <>
Future<void> initPacienteInjections() async {

  /*  Remote Datasource  */
  sl.registerSingleton<PacienteRemoteDatasource>(PacienteRemoteDatasourceImpl(sl()));

  /*  Local Datasource  */
  //sl.registerSingleton<AuthLocalDatasource>(AuthLocalDatasourceImpl(sl()));

  /*  Mapper  */
  sl.registerSingleton<PacienteMapper>(PacienteMapperImpl());

  /*  Repository  */
  sl.registerSingleton<PacienteRepository>(
      PacienteAdapter(
              remote: sl(),
              local: sl(),
              mapper: sl(),
              authMapper: sl()
          ),
  );

  /*  Use Cases  */
  sl.registerSingleton(
      BuscarPaciente(sl()),
  );

  sl.registerSingleton<ActualizarPaciente>(
      ActualizarPaciente(sl()),
  );

  sl.registerSingleton<ActualizarPassword>(
      ActualizarPassword(sl()),
  );

  sl.registerSingleton<CrearCuenta>(
      CrearCuenta(sl()),
  );

  sl.registerSingleton<IniciarSesion>(
      IniciarSesion(sl()),
  );

  /*  Bloc  */
  sl.registerSingleton<PacienteBloc>(PacienteBloc(buscarPacientePorId: sl())
  );

}