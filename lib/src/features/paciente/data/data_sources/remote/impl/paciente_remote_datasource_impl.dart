import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/endpoints/paciente_endpoints.dart';
import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/paciente_remote_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_request_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_response_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/auth_response_model.dart';
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
        return Right(PacienteResponseModel.fromJson(response.data));
      } else {
        return Left(ResourceNotFoundException(message: 'Paciente no encontrado'));
      }

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
      } else {
        return Left(SignUpException(message: response.statusMessage ?? 'Error al crear cuenta'));
      }
      
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
      } else {
        return Left(LoginException(message: response.statusMessage ?? 'Error al iniciar sesión'));
      }
      
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

}