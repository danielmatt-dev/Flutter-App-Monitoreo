import 'package:app_plataforma/src/features/promedio/data/data_sources/endpoints/promedio_endpoints.dart';
import 'package:app_plataforma/src/features/promedio/data/data_sources/remote/promedio_remote_datasource.dart';
import 'package:app_plataforma/src/features/promedio/data/models/promedio_model.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PromedioRemoteDatasourceImpl extends PromedioRemoteDatasource {

  final Dio dio;

  PromedioRemoteDatasourceImpl(this.dio);

  @override
  Future<Either<Exception, PromedioModel>> buscarPromedioSistolica(int folio) async {

    try {

      final response = await dio.get('${PromedioEndpoints.averageValorPresionSistolica}$folio');

      if(response.statusCode == 200){
        print('Sis: ${response.data}');
        return Right(PromedioModel.fromJson(response.data));
      }

      return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Promedio de la diastólica no encontrado'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, PromedioModel>> buscarPromedioDiastolica(int folio) async {

    try {

      final response = await dio.get('${PromedioEndpoints.averageValorPresionDiastolica}$folio');

      if(response.statusCode == 200){
        print('Dias: ${response.data}');
        return Right(PromedioModel.fromJson(response.data));
      }

      return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Promedio de la sistólica no encontrado'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, PromedioModel>> buscarPromedioGlucosa(int folio) async {

    try {

      final response = await dio.get('${PromedioEndpoints.averageValorGlucosa}$folio');

      if(response.statusCode == 200){
        print('Glucosa: ${response.data}');
        return Right(PromedioModel.fromJson(response.data));
      }

      return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Promedio de la glucosa no encontrado'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}