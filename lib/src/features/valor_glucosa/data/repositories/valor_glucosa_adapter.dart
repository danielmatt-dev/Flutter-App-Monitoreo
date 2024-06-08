import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/local/valor_glucosa_local_datasource.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/valor_glucosa_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/mapper/valor_glucosa_mapper.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/valor_glucosa_request_model.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_response.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:dartz/dartz.dart';

class ValorGlucosaAdapter extends ValorGlucosaRepository {

  final ValorGlucosaRemoteDataSource remote;
  final ValorGlucosaLocalDatasource local;
  final ValorGlucosaMapper mapper;

  ValorGlucosaAdapter({
    required this.remote,
    required this.local,
    required this.mapper
  });

  @override
  Future<Either<Exception, List<ValorGlucosaResponse>>> buscarValoresGlucosaDelDia(String fecha) async {

    final folio = local.getFolio();

    if(folio == null){
      return Left(ResourceNotFoundException(message: 'Folio no encontrado'));
    }

    final response = await remote.buscarValoresDelDia(folio, fecha);

    return response.fold(
            (failure) => Left(failure),
            (valores) => Right(valores.map((model) => mapper.toValorGlucosaResponse(model)).toList())
    );

  }

  @override
  Future<Either<Exception, bool>> ingresarValorGlucosa(ValorGlucosaRequest request) async {

    final idPaciente = local.getIdPaciente();

    if(idPaciente == null){
      return Left(ResourceNotFoundException(message: 'Id no encontrado'));
    }

    final response = await remote.ingresarValorGlucosa(
        ValorGlucosaRequestModel(
            idPaciente: idPaciente,
            valor: request.valor,
            medicion: request.medicion,
            notas: request.notas
        )
    );

    return response.fold(
            (failure) => Left(failure),
            (sucess) => Right(sucess)
    );

  }

  @override
  Future<Either<Exception, double>> promedioGlucosa() async {

    final folio = local.getFolio();

    if(folio == null){
      return Left(ResourceNotFoundException(message: 'Folio no encontrado'));
    }

    final response = await remote.buscarPromedioGlucosa(folio);

    return response.fold(
            (failure) => Left(failure),
            (average) => Right(average)
    );

  }

}