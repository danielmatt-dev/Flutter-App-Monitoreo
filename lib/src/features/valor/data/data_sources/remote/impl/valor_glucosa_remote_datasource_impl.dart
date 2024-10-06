import 'dart:io';

import 'package:app_plataforma/src/features/valor/data/data_sources/remote/valor_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor/data/models/impl/glucosa/valor_glucosa_request_model.dart';
import 'package:app_plataforma/src/features/valor/data/models/impl/glucosa/valor_glucosa_response_model.dart';
import 'package:app_plataforma/src/features/valor/data/models/promedio_model.dart';
import 'package:app_plataforma/src/features/valor/data/models/valor_request_model.dart';
import 'package:app_plataforma/src/features/valor/data/data_sources/remote/endpoints/valor_glucosa_endpoints.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class ValorGlucosaRemoteDatasourceImpl extends ValorRemoteDataSource {

  final Dio dio;

  ValorGlucosaRemoteDatasourceImpl(this.dio);

  @override
  Future<Either<Exception, List<ValorGlucosaResponseModel>>> buscarValoresDelDia(int folio, String fecha, String token) async {

    try{

      final response = await dio.get(
        '${ValorGlucosaEndpoints.findListValorGlucosaByDia}/$folio/$fecha',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        List<ValorGlucosaResponseModel> valores = (response.data as List).map((
            json) => ValorGlucosaResponseModel.fromJson(json)).toList();
        return Right(valores);
      }
      if(response.statusCode == 500){
        return Left(Exception('500: ${response.statusMessage}'));
      }

      return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Valor no encontrado'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, bool>> ingresarValor(ValorRequestModel model, String token) async {
    
    try{

      model as ValorGlucosaRequestModel;
      
      final response = await dio.post(
          ValorGlucosaEndpoints.saveValorGlucosa,
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
      return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Valor de la glucosa no ingresado'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
    
  }

  @override
  Future<Either<Exception, File>> generarPdf(int folio, int rango, String token) async {

    try {

      final response = await dio.get(
        '${ValorGlucosaEndpoints.generatePdf}/$folio/$rango',
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode != 200) {
        return Left(Exception(response.statusMessage ?? 'Pdf no generado'));
      }

      final formattedDate = DateFormat('ddMMyyyy').format(DateTime.now());

      String? contentDisposition = response.headers['content-disposition']?.first;
      String fileName = contentDisposition != null
          ? RegExp(r'filename="(.+)"').firstMatch(contentDisposition)?.group(1) ?? 'reporte_glucosa_folio_${folio}_$formattedDate.pdf'
          : 'reporte_glucosa_folio_${folio}_$formattedDate.pdf';

      final Directory? appDir = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();

      String tempPath = appDir!.path;
      final file = File('$tempPath/$fileName');

      if(!await file.exists()){
        await file.create();
      }

      // Aquí convertimos los bytes de respuesta en un `List<int>`
      await file.writeAsBytes(response.data as List<int>, flush: true);

      return Right(file);

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, PromedioModel>> buscarPromedio(int folio, String tipo, String token) async {
    try {

      final response = await dio.get(
          '${ValorGlucosaEndpoints.averageValorGlucosa}$folio',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
      );

      if(response.statusCode == 200){
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