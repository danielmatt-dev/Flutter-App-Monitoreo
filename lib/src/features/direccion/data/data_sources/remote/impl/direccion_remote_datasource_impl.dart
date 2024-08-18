import 'package:app_plataforma/src/features/direccion/data/data_sources/remote/direccion_remote_datasource.dart.dart';
import 'package:app_plataforma/src/features/direccion/data/data_sources/remote/endpoints/direccion_endpoints.dart';
import 'package:app_plataforma/src/features/direccion/data/models/direccion_model.dart';
import 'package:app_plataforma/src/features/direccion/data/models/direccion_response_model.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DireccionRemoteDatasourceImpl extends DireccionRemoteDatasource {
  
  final Dio dio;

  DireccionRemoteDatasourceImpl(this.dio);
  
  @override
  Future<Either<Exception, bool>> actualizarDireccion(DireccionModel model, String token) async {
    
    try {
      
      final response = await dio.put(
        DireecionEndpoints.updateDireccion,
        data: model.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200) {
        return const Right(true);
      }
      return Left(Exception(response.statusMessage ?? 'Dirección no actualizada'));
      
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

  @override
  Future<Either<Exception, DireccionResponseModel>> buscarDireccion(String codigoPostal, String token) async {

    try {

      final response = await dio.get(
        '${DireecionEndpoints.findyDireccionByCodigoPostal}$codigoPostal',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200) {
        return Right(DireccionResponseModel.fromJson(response.data));
      }

      if(response.statusCode == 404){
        return Left(ResourceNotFoundException(message: 'Dirección no encontrada'));
      }

      return Left(Exception(response.statusMessage ?? 'Error del servidor'));
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, DireccionModel>> buscarDireccionPaciente(String id, String token) async {

    try {

      final response = await dio.post(
        '${DireecionEndpoints.findDireccionById}$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200) {
        return Right(DireccionModel.fromJson(response.data));
      }

      return Left(Exception(response.statusMessage ?? 'Error del servidor'));
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}