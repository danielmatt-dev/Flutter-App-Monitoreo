import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/remote/endpoints/registro_respuestas_endpoints.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/data_sources/remote/registro_respuestas_remote_datasource.dart';
import 'package:app_plataforma/src/features/registro_respuestas/data/models/registro_respuestas_model.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RegistroRespuestasRemoteDatasourceImpl extends RegistroRespuestasRemoteDatasource {

  final Dio _dio;

  RegistroRespuestasRemoteDatasourceImpl(this._dio);

  @override
  Future<Either<Exception, bool>> guardarRespuestas(List<RegistroRespuestasModel> respuestas, String token) async {

    try {

      print(respuestas.map((respuesta) => respuesta.toJson()));

      final response = await _dio.post(
        RegistroRespuestasEndpoints.saveListaRespuestas,
        data: respuestas.map((respuesta) => respuesta.toJson()),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        return const Right(true);
      } else {
        return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Registro de respuestas no guardado'));
      }

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, bool>> guardarRespuestaSomatometria(RegistroRespuestasModel respuesta, String token) async {
    try {

      final response = await _dio.post(
        RegistroRespuestasEndpoints.saveRespuesta,
        data: respuesta.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        return const Right(true);
      } else {
        return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Registro de respuesta no guardado'));
      }

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

}