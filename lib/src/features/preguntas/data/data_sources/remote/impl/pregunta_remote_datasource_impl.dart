import 'package:app_plataforma/src/features/preguntas/data/data_sources/remote/endpoints/pregunta_endpoints.dart';
import 'package:app_plataforma/src/features/preguntas/data/data_sources/remote/pregunta_remote_datasource.dart';
import 'package:app_plataforma/src/features/preguntas/data/models/pregunta_model.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PreguntaRemoteDatasourceImpl extends PreguntaRemoteDatasource {

  final Dio dio;

  PreguntaRemoteDatasourceImpl(this.dio);

  @override
  Future<Either<Exception, List<PreguntaModel>>> buscarPreguntas() async {

    try {

      final response = await dio.get(PreguntaEndpoints.findAllPreguntas);

      if(response.statusCode == 200){
        final preguntas = response.data.map((json) => PreguntaModel.fromJson(json));
        return Right(preguntas);

      } else {
        return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Preguntas no encontradas'));
      }

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}