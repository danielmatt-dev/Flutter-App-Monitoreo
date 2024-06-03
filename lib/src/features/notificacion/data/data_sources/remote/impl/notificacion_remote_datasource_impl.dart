import 'dart:convert';
import 'package:app_plataforma/src/features/notificacion/data/data_sources/remote/endpoints/notificacion_endpoints.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';
import '../../../models/notificacion_model.dart';
import '../notificacion_remote_datasource.dart';
import 'package:dio/dio.dart';

class NotificacionRemoteDataSourceImpl extends NotificacionRemoteDataSource {

  final _dio = Dio();

  NotificacionRemoteDataSourceImpl();

  @override
  Future<Either<Exception, NotificacionModel>> buscarNotificacion() async {

    try {

      final response = await _dio.get('${NotificacionEndpoints.findNotificacionById}1');

      if(response.statusCode == 200){
        return Right(NotificacionModel.fromJson(response.data));
      } else {
        return Left(ResourceNotFoundException(message: 'Notificacion no encontrada'));
      }

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, List<NotificacionModel>>> buscarNotificaciones() async {

    try {

      final response = await _dio.get(NotificacionEndpoints.findAllNotificaciones);

      if(response.statusCode == 200){
        
        final listaNofiticaciones = (json.decode(response.data) as List)
            .map((e) => NotificacionModel.fromJson(e))
            .toList();

        return Right(listaNofiticaciones);

      } else {
        return Left(ResourceNotFoundException(message: 'Notificaciones no encontradas'));
      }

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}
