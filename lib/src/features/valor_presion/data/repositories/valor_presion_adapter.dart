import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/valor_presion/data/data_sources/remote/valor_presion_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/valor_presion_request_model.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/repositories/valor_presion_repository.dart';
import 'package:app_plataforma/src/features/valor_response/domain/entities/mapper/valor_response_mapper.dart';
import 'package:app_plataforma/src/features/valor_response/domain/entities/valor_response.dart';
import 'package:dartz/dartz.dart';

class ValorPresionAdapter extends ValorPresionRepository {

  final ValorPresionRemoteDataSource remote;
  final AuthRepository local;
  final ValorResponseMapper mapper;
  
  ValorPresionAdapter({
    required this.remote,
    required this.local,
    required this.mapper
  });
  
  @override
  Future<Either<Exception, List<ValorResponse>>> buscarValoresPresionDelDia(String fecha) async {

    local.setFolio(1);

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

              final response = await remote.buscarValoresDelDia(folio, fecha);

              return response.fold(
                      (failure) => Left(failure),
                      (models) => Right(models.map((model) => mapper.toValorResponsePresion(model)).toList())
              );

            }
    );

  }

  @override
  Future<Either<Exception, bool>> ingresarValorPresion(ValorPresionRequest request) async {

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

              final response = await remote.ingresarValorPresion(
                  ValorPresionRequestModel(
                      folio: folio,
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
            );

  }

}