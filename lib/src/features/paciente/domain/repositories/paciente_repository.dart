import 'package:app_plataforma/src/features/auth_response/domain/entities/auth_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_update_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:dartz/dartz.dart';

abstract class PacienteRepository {

  Future<Either<Exception, PacienteResponse>> buscarPaciente();

  Future<Either<Exception, AuthResponse>> iniciarSesion(Usuario usuario);

  Future<Either<Exception, AuthResponse>> crearCuenta(PacienteRequest request);

  Future<Either<Exception, bool>> actualizarPaciente(PacienteUpdateRequest request);

}
