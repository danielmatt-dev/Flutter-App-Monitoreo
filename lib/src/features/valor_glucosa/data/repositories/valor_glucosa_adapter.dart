import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/valor_glucosa_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/valor_glucosa_request_model.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor_response/domain/entities/mapper/valor_response_mapper.dart';
import 'package:app_plataforma/src/features/valor_response/domain/entities/valor_response.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:dartz/dartz.dart';

class ValorGlucosaAdapter extends ValorGlucosaRepository {

  final ValorGlucosaRemoteDataSource remote;
  final AuthRepository local;
  final ValorResponseMapper mapper;
  
  ValorGlucosaAdapter({
    required this.remote,
    required this.local,
    required this.mapper,
  });

  @override
  Future<Either<Exception, List<ValorResponse>>> buscarValoresGlucosaDelDia(String fecha) async {

    local.setFolio(1);

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {
              final response = await remote.buscarValoresDelDia(folio, fecha);

              return response.fold(
                      (failure) => Left(failure),
                      (valores) => Right(valores.map((model) => mapper.toValorResponseGlucosa(model)).toList())
              );
            }
    );

  }

  @override
  Future<Either<Exception, bool>> ingresarValorGlucosa(ValorGlucosaRequest request) async {

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

              final response = await remote.ingresarValorGlucosa(
                  ValorGlucosaRequestModel(
                      folio: folio,
                      valor: request.valor,
                      medicion: request.medicion,
                      notas: request.notas
                  )
              );

              return response.fold(
                      (failure) => Left(failure),
                      (success) => Right(success)
              );
            }
    );

  }

}