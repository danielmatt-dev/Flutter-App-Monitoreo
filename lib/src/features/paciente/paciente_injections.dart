import 'package:app_plataforma/src/features/auth_response/domain/usecases/buscar_fecha_expiracion.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/remover_fecha_expiracion.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/set_fecha_expiracion.dart';
import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/impl/paciente_remote_datasource_impl.dart';
import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/paciente_remote_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/models/mapper/paciente_mapper.dart';
import 'package:app_plataforma/src/features/paciente/data/repositories/paciente_adapter.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/mapper/paciente_map_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/mapper/paciente_map_mapper_impl.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/actualizar_paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/actualizar_password.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_perfil_asignado.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/crear_cuenta.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/iniciar_sesion.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/reestablecer_password.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/validar_actualizacion_correo.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/validar_correo.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/validar_existencia_correo.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/cubit/auth_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/cubit/paciente_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/bloc/password_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

// <>
Future<void> initPacienteInjections() async {

  /*  Remote Datasource  */
  sl.registerSingleton<PacienteRemoteDatasource>(PacienteRemoteDatasourceImpl(sl()));

  /*  Mapper  */
  sl.registerSingleton<PacienteMapper>(PacienteMapperImpl());

  sl.registerSingleton<PacienteMapMapper>(PacienteMapMapperImpl());

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
  sl.registerSingleton(BuscarPaciente(sl()));

  sl.registerSingleton<ActualizarPaciente>(ActualizarPaciente(sl()));

  sl.registerSingleton<ActualizarPassword>(ActualizarPassword(sl()));

  sl.registerSingleton<CrearCuenta>(CrearCuenta(sl()),);

  sl.registerSingleton<IniciarSesion>(IniciarSesion(sl()),);

  sl.registerSingleton<ValidarCorreo>(ValidarCorreo(sl()));

  sl.registerSingleton<ReestablecerPassword>(ReestablecerPassword(sl()));

  sl.registerSingleton<ValidarExistenciaCorreo>(ValidarExistenciaCorreo(sl()));

  sl.registerSingleton<ValidarActualizacionCorreo>(ValidarActualizacionCorreo(sl()));

  sl.registerSingleton<BuscarPerfilAsignado>(BuscarPerfilAsignado(sl()));

  sl.registerSingleton<BuscarFechaExpiracion>(BuscarFechaExpiracion(sl()));

  sl.registerSingleton<SetFechaExpiracion>(SetFechaExpiracion(repository: sl()));

  sl.registerSingleton<RemoverFechaExpiracion>(RemoverFechaExpiracion(repository: sl()));

  /*  Bloc  */
  sl.registerSingleton<PacienteBloc>(
      PacienteBloc(
          buscarPaciente: sl(),
          actualizarPaciente: sl(),
          mapper: sl(),
          buscarCorreo: sl(),
          buscarUsuario: sl()
      )
  );

  sl.registerSingleton<AuthCubit>(
      AuthCubit(
        crearCuenta: sl(),
        buscarPerfilAsignado: sl(),
        validarExistenciaCorreo: sl(),
        validarActualizacionCorreo: sl(),
        validarCorreoReset: sl(),
        reestablecerPassword: sl(),
        buscarFechaExpiracion: sl(),
        guardarTratamientos: sl(),
        guardarRespuestas: sl(),
        setBuscarFechaExpiracion: sl(),
        removerFechaExpiracion: sl()
      )
  );

  sl.registerSingleton<PasswordBloc>(
      PasswordBloc(
        actualizarPassword: sl()
      )
  );

  /*  Cubit  */
  sl.registerSingleton<PacienteCubit>(
      PacienteCubit(
          buscarPaciente: sl(),
          mapper: sl(),
          iniciarSesion: sl()
      )
  );

}