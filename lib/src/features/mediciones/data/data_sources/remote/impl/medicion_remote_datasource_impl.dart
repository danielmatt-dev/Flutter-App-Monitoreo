import 'package:app_plataforma/src/features/mediciones/data/data_sources/remote/endpoints/configuracion_endpoints.dart';
import 'package:app_plataforma/src/features/mediciones/data/data_sources/remote/medicion_remote_datasource.dart';
import 'package:app_plataforma/src/features/mediciones/data/models/medicion_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MedicionRemoteDatasourceImpl extends MedicionRemoteDatasource {

  final Dio dio;

  MedicionRemoteDatasourceImpl(this.dio);

  @override
  Future<Either<Exception, List<MedicionModel>>> buscarConfiguracion(int folio, String tipo, String token) async {

    try {

      final response = await dio.get(
        '${ConfiguracionEndpoints.findMediciones}$tipo/$folio',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if(response.statusCode == 200){
        return Right((response.data as List).map((model) => MedicionModel.fromJson(model)).toList());
      } else {
        return Left(Exception(response.statusMessage ?? 'Configuración no encontrada'));
      }

    } on DioException catch (e) {
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}