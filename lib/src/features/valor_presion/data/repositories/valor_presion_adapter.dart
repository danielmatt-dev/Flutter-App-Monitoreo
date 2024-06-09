import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/local/valor_glucosa_local_datasource.dart';
import 'package:app_plataforma/src/features/valor_presion/data/data_sources/remote/valor_presion_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/mapper/valor_presion_mapper.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/valor_presion_request_model.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_response.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/repositories/valor_presion_repository.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';

class ValorPresionAdapter extends ValorPresionRepository {

  final ValorPresionRemoteDataSource remote;
  final ValorGlucosaLocalDatasource local;
  final ValorPresionMapper mapper;

  ValorPresionAdapter({
    required this.remote,
    required this.local,
    required this.mapper
  });

  @override
  Future<Either<Exception, List<ValorPresionResponse>>> buscarValoresPresionDelDia(String fecha) async {

    final folio = local.getFolio();

    if(folio == null){
      return Left(ResourceNotFoundException(message: 'Folio no encontrado'));
    }

    final response = await remote.buscarValoresDelDia(folio, fecha);

    return response.fold(
            (failure) => Left(failure),
            (models) => Right(models.map((model) => mapper.toValorPresionResponse(model)).toList())
    );

  }

  @override
  Future<Either<Exception, bool>> ingresarValorPresion(ValorPresionRequest request) async {

    final idPaciente = local.getIdPaciente();

    if(idPaciente == null){
      return Left(ResourceNotFoundException(message: 'Id no encontrado'));
    }

    final response = await remote.ingresarValorPresion(
      ValorPresionRequestModel(
          idPaciente: idPaciente,
          valorSistolica: request.valorSistolica,
          valorDiastolica: request.valorDiastolica,
          medicion: request.medicion,
          notas: request.notas
      )
    );

    return response.fold(
            (failure) => Left(failure),
            (r) => Right(r)
    );

  }

  @override
  Future<Either<Exception, double>> buscarPromedioSistolica() async {

    final folio = local.getFolio();

    if(folio == null){
      return Left(ResourceNotFoundException(message: 'Folio no encontrado'));
    }

    final response = await remote.buscarPromedioSistolica(folio);

    return response.fold(
            (failure) => Left(failure),
            (promedio) => Right(promedio)
    );

  }

  @override
  Future<Either<Exception, double>> buscarPromedioDiastolica() async {

    final folio = local.getFolio();

    if(folio == null){
      return Left(ResourceNotFoundException(message: 'Folio no encontrado'));
    }

    final response = await remote.buscarPromedioDiastolica(folio);

    return response.fold(
            (failure) => Left(failure),
            (promedio) => Right(promedio)
    );

  }

}