import 'package:app_plataforma/src/features/paciente/data/models/paciente_password_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_request_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_response_model.dart';
import 'package:app_plataforma/src/features/auth_response/data/models/auth_response_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_update_request_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/usuario_model.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class PacienteRemoteDatasource {

  Future<Either<Exception, PacienteResponseModel>> buscarPacientePorId(String idPaciente);

  Future<Either<Exception, AuthResponseModel>> iniciarSesion(UsuarioModel usuario);

  Future<Either<Exception, AuthResponseModel>> crearCuenta(PacienteRequestModel paciente);

  Future<Either<Exception, AuthResponseModel>> actualizarPaciente(PacienteUpdateRequestModel model);

  Future<Either<Exception, AuthResponseModel>> actualizarPassword(PacientePasswordModel model);

  Future<Either<Exception, AuthResponseModel>> validarCorreo(String correo);

  Future<Either<Exception, AuthResponseModel>> reestablecerPassword(UsuarioModel model);

}