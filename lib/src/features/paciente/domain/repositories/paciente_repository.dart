import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_password.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_update_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:dartz/dartz.dart';

abstract class PacienteRepository {

  Future<Either<Exception, PacienteResponse>> buscarPaciente();

  Future<Either<Exception, bool>> validarExistenciaCorreo(String correo);

  Future<Either<Exception, bool>> validarActualizacionCorreo(String correo);

  Future<Either<Exception, bool>> buscarPerfilAsignado();

  Future<Either<Exception, bool>> iniciarSesion(Usuario usuario);

  Future<Either<Exception, bool>> crearCuenta(PacienteRequest request);

  Future<Either<Exception, bool>> actualizarPaciente(PacienteUpdateRequest request);

  Future<Either<Exception, bool>> actualizarPassword(PacientePassword pacientePassword);

  Future<Either<Exception, bool>> validarCorreo(String correo);

  Future<Either<Exception, bool>> reestablecerPassword(Usuario usuario);

}
