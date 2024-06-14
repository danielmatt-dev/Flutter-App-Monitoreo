import 'package:app_plataforma/src/features/valor_presion/data/data_sources/remote/endpoints/valor_presion_endpoints.dart';
import 'package:app_plataforma/src/features/valor_presion/data/data_sources/remote/valor_presion_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/valor_presion_request_model.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/valor_presion_response_model.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// <>
class ValorPresionRemoteDataSourceImpl extends ValorPresionRemoteDataSource {

  final Dio dio;

  ValorPresionRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Exception, List<ValorPresionResponseModel>>> buscarValoresDelDia(int folio, String fecha) async {
    try {

      print('Llegmoas pre aqui');

      final response = await dio.get('${ValorPresionEndpoints.findListValorPresionByDia}/$folio/$fecha');

      print(response.data);

      if(response.statusCode == 200){
        List<ValorPresionResponseModel> valores = (response.data as List).map((json) => ValorPresionResponseModel.fromJson(json)).toList();
        return Right(valores);

//        return Right(response.data.map((json) => ValorPresionResponseModel.fromJson(json)));
      }

      if(response.statusCode == 500){
        return Left(Exception('500: ${response.statusMessage}'));
      }

      return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Valores de la presión no encontrados'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, bool>> ingresarValorPresion(ValorPresionRequestModel model) async {

    try {

      final response = await dio.post(ValorPresionEndpoints.saveValorPresion, data: model.toJson());

      if(response.statusCode == 200){
        return const Right(true);
      }

      return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Valor de la presión no guardado'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}