import 'package:app_plataforma/src/features/paciente/data/models/paciente_password_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_request_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_response_model.dart';
import 'package:app_plataforma/src/features/auth_response/data/models/auth_response_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_update_request_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/usuario_model.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class PacienteRemoteDatasource {

  Future<Either<Exception, PacienteResponseModel>> buscarPacientePorId(String idPaciente, String token);

  Future<Either<Exception, bool>> validarExistenciaCorreo(String correo);

  Future<Either<Exception, bool>> validarActualizacionCorreo(String correo, String token);

  Future<Either<Exception, bool>> buscarPerfilAsignado(int folio, String token);

  Future<Either<Exception, AuthResponseModel>> iniciarSesion(UsuarioModel usuario, String fcmToken);

  Future<Either<Exception, AuthResponseModel>> crearCuenta(PacienteRequestModel paciente, String fcmToken);

  Future<Either<Exception, AuthResponseModel>> actualizarPaciente(PacienteUpdateRequestModel model, String token);

  Future<Either<Exception, AuthResponseModel>> actualizarPassword(PacientePasswordModel model, String token);

  Future<Either<Exception, AuthResponseModel>> validarCorreo(String correo, String token);

  Future<Either<Exception, AuthResponseModel>> reestablecerPassword(UsuarioModel model, String token);

}