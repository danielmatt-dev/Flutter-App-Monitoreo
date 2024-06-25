import 'package:app_plataforma/src/features/direccion/data/data_sources/remote/direccion_remote_datasource.dart.dart';
import 'package:app_plataforma/src/features/direccion/data/data_sources/remote/endpoints/direccion_endpoints.dart';
import 'package:app_plataforma/src/features/direccion/data/models/direccion_model.dart';
import 'package:app_plataforma/src/features/direccion/data/models/direccion_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DireccionRemoteDatasourceImpl extends DireccionRemoteDatasource {
  
  final Dio dio;

  DireccionRemoteDatasourceImpl(this.dio);
  
  @override
  Future<Either<Exception, bool>> actualizarDireccion(DireccionModel model) async {
    
    try {
      
      final response = await dio.put(DireecionEndpoints.updateDireccion, data: model.toJson());

      return response.statusCode == 200
          ? const Right(true)
          : Left(Exception(response.statusMessage ?? 'Dirección no actualizada'));
      
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

  @override
  Future<Either<Exception, DireccionResponseModel>> buscarDireccion(String codigoPostal) async {

    try {

      final response = await dio.get('${DireecionEndpoints.findyDireccionByCodigoPostal}$codigoPostal');

      return response.statusCode == 200
          ? Right(DireccionResponseModel.fromJson(response.data))
          : Left(Exception(response.statusMessage ?? 'Dirección no encontrada'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}