import 'package:app_plataforma/src/features/notificacion/data/data_sources/remote/endpoints/notificacion_endpoints.dart';
import 'package:app_plataforma/src/features/notificacion/data/data_sources/remote/notificacion_remote_datasource.dart';
import 'package:app_plataforma/src/features/notificacion/data/models/notificacion_model.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// <>
class NotificacionRemoteDataSourceImpl extends NotificacionRemoteDataSource {

  final Dio dio;

  NotificacionRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Exception, NotificacionModel>> buscarNotificacion(int folio) async {

    try {

      final response = await dio.get('${NotificacionEndpoints.findNotificacionById}$folio');

      if (response.statusCode == 200){
        return Right(NotificacionModel.fromJson(response.data));
      }
      return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Notificacion no encontrada'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, List<NotificacionModel>>> buscarNotificaciones() async {

    try {

      final response = await dio.get(NotificacionEndpoints.findAllNotificaciones);

      if(response.statusCode == 200){
        List<NotificacionModel> notificaciones = (response.data as List).map((json) => NotificacionModel.fromJson(json)).toList();
        return Right(notificaciones);
      }
      return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Notificaciones no encontradas'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, List<NotificacionModel>>> buscarNotificacionesPersonales(int folio) async {

    try {


      final response = await dio.get('${NotificacionEndpoints.findAllNotificacionesPersonales}$folio');

      if(response.statusCode == 200) {
        print('Personal');
        List<NotificacionModel> notificaciones = (response.data as List).map((json) => NotificacionModel.fromJson(json)).toList();
        return Right(notificaciones);
      }
      return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Notificaciones no encontradas'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}
