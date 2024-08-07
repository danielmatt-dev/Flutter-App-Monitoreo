import 'package:app_plataforma/src/features/tratamiento/data/data_sources/remote/endpoints/tratamiento_endpoints.dart';
import 'package:app_plataforma/src/features/tratamiento/data/data_sources/remote/tratamiento_remote_datasource.dart';
import 'package:app_plataforma/src/features/tratamiento/data/models/tratamiento_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TratamientoRemoteDatasourceImpl extends TratamientoRemoteDatasource {

  final Dio _dio;

  TratamientoRemoteDatasourceImpl(Dio dio) : _dio = dio;

  @override
  Future<Either<Exception, List<TratamientoModel>>> buscarTratamientos(String token) async {

    try {

      final response = await _dio.get(
        TratamientoEndpoints.findAllTratamientos,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        List<TratamientoModel> tratamientos = (response.data as List).map((json) => TratamientoModel.fromJson(json)).toList();
        return Right(tratamientos);
      }
      return Left(Exception(response.statusMessage ?? 'Tratamiento no encontrados'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}