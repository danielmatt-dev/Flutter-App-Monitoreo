import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/endpoints/paciente_endpoints.dart';
import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/paciente_remote_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_password_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_request_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_response_model.dart';
import 'package:app_plataforma/src/features/auth_response/data/models/auth_response_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_update_request_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/usuario_model.dart';
import 'package:app_plataforma/src/shared/exceptions/login_exception.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:app_plataforma/src/shared/exceptions/signup_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PacienteRemoteDatasourceImpl extends PacienteRemoteDatasource {

  final Dio dio;

  PacienteRemoteDatasourceImpl(this.dio);

  @override
  Future<Either<Exception, PacienteResponseModel>> buscarPacientePorId(String idPaciente, String token) async {

    try{

      final response = await dio.get(
        '${PacienteEndpoints.findPacienteById}$idPaciente',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        return Right(PacienteResponseModel.fromJson(response.data));
      }

      return Left(ResourceNotFoundException(message: 'Paciente no encontrado'));

    } on DioException catch (e){
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, AuthResponseModel>> crearCuenta(PacienteRequestModel paciente, String fcmToken) async {
    
    try{

      final response = await dio.post(
        PacienteEndpoints.signup,
        data: paciente.toJson(),
        options: Options(
          headers: {
            'FCM-Token': fcmToken,
            'Content-Type': 'application/json',
          },
        ),
      );
      
      if(response.statusCode == 200){
        return Right(AuthResponseModel.fromJson(response.data));
      }

      return Left(SignUpException(message: response.statusMessage ?? 'Error al crear cuenta'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

  @override
  Future<Either<Exception, AuthResponseModel>> iniciarSesion(UsuarioModel usuario, String fcmToken) async {
    
    try {

      final response = await dio.post(
        PacienteEndpoints.login,
        data: usuario.toJson(),
        options: Options(
          headers: {
            'FCM-Token': fcmToken,
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        return Right(AuthResponseModel.fromJson(response.data));
      }

      if(response.statusCode == 401){
        return Left(LoginException(message: response.statusMessage ?? 'Credenciales incorrectas'));
      }

      return Left(Exception(response.statusMessage ?? 'Error al iniciar sesión'));

    } on DioException catch (e) {

      if(e.response?.statusCode == 401){
        return Left(BadCredentialsException(message: e.message ?? 'Credenciales incorrectas'));
      }
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

  @override
  Future<Either<Exception, AuthResponseModel>> actualizarPaciente(PacienteUpdateRequestModel model, String token) async {
    try {

      final response = await dio.put(
        PacienteEndpoints.updatePaciente,
        data: model.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        return Right(AuthResponseModel.fromJson(response.data));
      }

      return Left(Exception(response.statusMessage ?? 'Error al actualizar paciente'));

    } on DioException catch (e) {

      if(e.response?.statusCode == 400){
        return Left(BadRequestException(message: e.message ?? 'Datos no válidos'));
      }

      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

  @override
  Future<Either<Exception, AuthResponseModel>> actualizarPassword(PacientePasswordModel model, String token) async {

    try {

      final response = await dio.patch(
        PacienteEndpoints.updatePassword,
        data: model.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        return Right(AuthResponseModel.fromJson(response.data));
      }

      return Left(Exception(response.statusMessage ?? 'Error al actualizar constraseña'));
    } on DioException catch (e) {

      if(e.response?.statusCode == 400){
        return Left(BadRequestException(message: 'La contraseña antigua no coincide'));
      }

      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, AuthResponseModel>> reestablecerPassword(UsuarioModel model, String token) async {
    try {

      final response = await dio.patch(
        PacienteEndpoints.resetPassword,
        data: model.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        return Right(AuthResponseModel.fromJson(response.data));
      }

      return Left(Exception(response.statusMessage ?? 'Error al reestablecer constraseña'));

    } on DioException catch (e) {

      if(e.response?.statusCode == 400){
        return Left(BadRequestException(message: e.message ?? 'Correo no existe'));
      }
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, AuthResponseModel>> validarCorreo(String correo) async {
    try {

      final response = await dio.get('${PacienteEndpoints.validateEmail}$correo',);

      if(response.statusCode == 200){
        return Right(AuthResponseModel.fromJson(response.data));
      }

      return Left(Exception(response.statusMessage ?? 'Correo no válido'));
    } on DioException catch (e) {

      if(e.response?.statusCode == 404) {
       return Left(ResourceNotFoundException(message: 'Correo no encontrado'));
      }
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> buscarPerfilAsignado(int folio, String token) async {

    try {

      final response = await dio.post(
        '${PacienteEndpoints.findPerfilAsignado}$folio',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        return Right(response.data['body']);
      }

      return Left(Exception(response.statusMessage ?? 'Error del servidor'));
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, bool>> validarExistenciaCorreo(String correo) async {

    try {

      final response = await dio.get('${PacienteEndpoints.validateEmailAlreadyRegistered}$correo');

      if(response.statusCode == 200){
        return Right(response.data['body']);
      }

      return Left(Exception(response.statusMessage ?? 'Error interno del servidor'));
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, bool>> validarActualizacionCorreo(String correo, String token) async {
    try {

      final response = await dio.post(
        '${PacienteEndpoints.validateEmailUpdate}$correo',
          options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        )
      );

      if(response.statusCode == 200){
        return Right(response.data['body']);
      }

      return Left(Exception(response.statusMessage ?? 'Error interno del servidor'));
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

}