import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/endpoints/paciente_endpoints.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_model.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../paciente_remote_datasource.dart';

class PacienteRemoteDatasourceImpl extends PacienteRemoteDatasource{

  final Dio dio;

  PacienteRemoteDatasourceImpl(this.dio);

  @override
  Future<Either<Exception, PacienteModel>> buscarPacientePorId(String idPaciente) async {

    try{

      final response = await dio.get('${PacienteEndpoints.findPacienteById}$idPaciente');

      if(response.statusCode == 200){
        return Right(PacienteModel.fromJson(response.data));
      } else {
        return Left(ResourceNotFoundException(message: 'Paciente no encontrado'));
      }

    } on DioException catch (e){
      return Left(Exception(e.message));
    } catch (e) {
      return Left(Exception(e.toString()));
    }

  }

}