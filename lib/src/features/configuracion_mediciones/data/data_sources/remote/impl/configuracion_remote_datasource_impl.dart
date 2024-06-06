import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/remote/configuracion_remote_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/remote/endpoints/configuracion_endpoints.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/configuracion_mediciones_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ConfiguracionRemoteDatasourceImpl extends ConfiguracionRemoteDatasource {

  final Dio dio;

  ConfiguracionRemoteDatasourceImpl(this.dio);

  @override
  Future<Either<Exception, ConfiguracionMedicionesModel>> buscarConfiguracion(String idPaciente) async {

    try {

      final response = await dio.get('${ConfiguracionEndpoints.findConfiguracionByIdPaciente}$idPaciente');

      if(response.statusCode == 200){
        return Right(ConfiguracionMedicionesModel.fromJson(response.data));
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