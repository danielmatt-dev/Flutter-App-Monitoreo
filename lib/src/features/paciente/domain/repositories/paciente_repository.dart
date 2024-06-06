import 'package:app_plataforma/src/features/paciente/domain/entities/auth_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:dartz/dartz.dart';
import '../entities/paciente_response.dart';

abstract class PacienteRepository {

  Future<Either<Exception, PacienteResponse>> buscarPaciente(String idPaciente);

  Future<Either<Exception, AuthResponse>> iniciarSesion(Usuario usuario);

  Future<Either<Exception, AuthResponse>> crearCuenta(PacienteRequest request);

}
