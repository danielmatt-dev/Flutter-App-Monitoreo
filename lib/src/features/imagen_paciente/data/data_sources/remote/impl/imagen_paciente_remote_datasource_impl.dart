import 'package:app_plataforma/src/features/imagen_paciente/data/data_sources/remote/endpoints/imagen_paciente_endpoints.dart';
import 'package:app_plataforma/src/features/imagen_paciente/data/data_sources/remote/imagen_paciente_remote_datasource.dart';
import 'package:app_plataforma/src/features/imagen_paciente/data/models/imagen_paciente_request_model.dart';
import 'package:app_plataforma/src/features/imagen_paciente/data/models/imagen_paciente_response_model.dart';
import 'package:app_plataforma/src/features/imagen_paciente/data/models/imagen_paciente_search_request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ImagenPacienteRemoteDatasourceImpl extends ImagenPacienteRemoteDatasource {

  final Dio dio;

  ImagenPacienteRemoteDatasourceImpl({required this.dio});

  @override
  Future<Either<Exception, List<ImagenPacienteResponseModel>>> buscarImagenes(ImagenPacienteSearchRequestModel model, String token) async {

    try {
      final response = await dio.get(
        ImagenPacienteEndpoints.searchImages,
        data: model,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<ImagenPacienteResponseModel> imagenes = (response.data as List)
            .map((e) => ImagenPacienteResponseModel.fromJson(e))
            .toList();
        return Right(imagenes);
      }

      return Left(Exception(response.statusMessage ?? 'Error al buscar imágenes'));
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, bool>> guardarImagen(ImagenPacienteRequestModel model, String token) async {

    try {

      final response = await dio.post(
        ImagenPacienteEndpoints.saveImagen,
        data: model.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        )
      );

      if(response.statusCode == 200){
        return const Right(true);
      }

      return Left(Exception(response.statusMessage ?? 'Error al guardar imágenes'));
    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

}