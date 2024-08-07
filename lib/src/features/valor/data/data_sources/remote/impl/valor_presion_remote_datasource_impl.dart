import 'dart:io';

import 'package:app_plataforma/src/features/valor/data/data_sources/remote/valor_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor/data/models/impl/presion/valor_presion_request_model.dart';
import 'package:app_plataforma/src/features/valor/data/models/impl/presion/valor_presion_response_model.dart';
import 'package:app_plataforma/src/features/valor/data/models/promedio_model.dart';
import 'package:app_plataforma/src/features/valor/data/models/valor_request_model.dart';
import 'package:app_plataforma/src/features/valor/data/data_sources/remote/endpoints/valor_presion_endpoints.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

// <>
class ValorPresionRemoteDataSourceImpl extends ValorRemoteDataSource {

  final Dio dio;

  ValorPresionRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Exception, List<ValorPresionResponseModel>>> buscarValoresDelDia(int folio, String fecha, String token) async {
    try {

      final response = await dio.get(
        '${ValorPresionEndpoints.findListValorPresionByDia}/$folio/$fecha',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200) {

        List<ValorPresionResponseModel> valores = (response.data as List).map((json) =>
            ValorPresionResponseModel.fromJson(json)).toList();
        return Right(valores);

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
  Future<Either<Exception, bool>> ingresarValor(ValorRequestModel model, String token) async {

    try {

      model as ValorPresionRequestModel;

      final response = await dio.post(
        ValorPresionEndpoints.saveValorPresion,
        data: model.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

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

  @override
  Future<Either<Exception, File>> generarPdf(int folio, int rango, String token) async {

    try {

      final response = await dio.get(
        '${ValorPresionEndpoints.generatePdf}/$folio/$rango',
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode != 200){
        return Left(Exception(response.statusMessage ?? 'Pdf no generado'));
      }

      final Directory? appDir = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();

      String tempPath = appDir!.path;

      final file = File('$tempPath/reporte-$folio.pdf');

      if(!await file.exists()){
        await file.create();
      }

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

    String endpoint = '';

    if(tipo == 'sistolica'){
      endpoint = ValorPresionEndpoints.averageValorPresionSistolica;
    }
    if(tipo == 'diastolica'){
      endpoint = ValorPresionEndpoints.averageValorPresionDiastolica;
    }

    try {

      final response = await dio.get(
        '$endpoint$folio',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        return Right(PromedioModel.fromJson(response.data));
      }

      return Left(ResourceNotFoundException(message: response.statusMessage ?? 'Promedio no encontrado'));

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}