import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/endpoints/valor_glucosa_endpoints.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/valor_glucosa_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/valor_glucosa_request_model.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/valor_glucosa_response_model.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:app_plataforma/src/shared/utils/base_url.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ValorGlucosaRemoteDatasourceImpl extends ValorGlucosaRemoteDataSource {

  final Dio dio;

  ValorGlucosaRemoteDatasourceImpl(this.dio);

  @override
  Future<Either<Exception, List<ValorGlucosaResponseModel>>> buscarValoresDelDia(int folio, String fecha) async {

    try{

      final response = await dio.get('$baseUrl${ValorGlucosaEndpoints.findListValorGlucosaByDia}/$folio/$fecha');

      if(response.statusCode == 200){
        final valores = response.data.map((json) => ValorGlucosaResponseModel.fromJson(json)).toList();
        return Right(valores);
      } else {
        return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Valor no encontrado'));
      }

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, bool>> ingresarValorGlucosa(ValorGlucosaRequestModel model) async {
    
    try{
      
      final response = await dio.post(ValorGlucosaEndpoints.saveValorGlucosa, data: model.toJson());

      if(response.statusCode != 200 || response.data !is int){
        return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Valor de la glucosa no ingresado'));
      }
      return const Right(true);

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

}