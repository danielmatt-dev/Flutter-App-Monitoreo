import 'package:app_plataforma/src/features/comentario/data/data_sources/remote/comentario_remote_datasource.dart';
import 'package:app_plataforma/src/features/comentario/data/data_sources/remote/endpoints/comentario_endpoints.dart';
import 'package:app_plataforma/src/features/comentario/data/models/comentario_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ComentarioRemoteDatasourceImpl extends ComentarioRemoteDatasource {

  final Dio _dio;

  ComentarioRemoteDatasourceImpl(Dio dio): _dio = dio;

  @override
  Future<Either<Exception, bool>> guardarComentario(ComentarioModel model, String token) async {

    try {

      final response = await _dio.post(
        ComentarioEndpoints.saveComentario,
        data: model.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }
        )
      );

      if(response.statusCode == 200){
        return const Right(true);
      }
      return const Right(false);
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}