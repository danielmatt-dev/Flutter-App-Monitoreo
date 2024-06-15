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

class PacienteRemoteDatasourceImpl extends PacienteRemoteDatasource{

  final Dio dio;

  PacienteRemoteDatasourceImpl(this.dio);

  @override
  Future<Either<Exception, PacienteResponseModel>> buscarPacientePorId(String idPaciente) async {

    try{

      final response = await dio.get('${PacienteEndpoints.findPacienteById}$idPaciente');

      if(response.statusCode == 200){
        print(response.data);
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
  Future<Either<Exception, AuthResponseModel>> crearCuenta(PacienteRequestModel paciente) async {
    
    try{
      
      final response = await dio.post(PacienteEndpoints.signup, data: paciente.toJson());
      
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
  Future<Either<Exception, AuthResponseModel>> iniciarSesion(UsuarioModel usuario) async {
    
    try {
      
      final response = await dio.get(PacienteEndpoints.login, data: usuario.toJson());
      
      if(response.statusCode == 200){
        return Right(AuthResponseModel.fromJson(response.data));
      }

      return Left(LoginException(message: response.statusMessage ?? 'Error al iniciar sesión'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

  @override
  Future<Either<Exception, bool>> actualizarPaciente(PacienteUpdateRequestModel model) async {
    try {

      final response = await dio.put(PacienteEndpoints.updatePaciente, data: model.toJson());

      if(response.statusCode == 200){
        return Right(response.data);
      }

      return Left(Exception(response.statusMessage ?? 'Error al actualizar paciente'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

  @override
  Future<Either<Exception, bool>> actualizarPassword(PacientePasswordModel model) async {

    try {

      final response = await dio.patch(PacienteEndpoints.updatePassword, data: model.toJson());

      if(response.statusCode == 200){
        return Right(response.data);
      }
      return Left(Exception(response.statusMessage ?? 'Error al actualizar constraseña'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}