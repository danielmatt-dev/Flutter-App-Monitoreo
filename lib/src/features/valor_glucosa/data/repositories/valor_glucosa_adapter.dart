import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/remote/valor_glucosa_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/mapper/valor_glucosa_mapper.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/valor_glucosa_request_model.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_response.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/shared/valor/entities/valor_average.dart';
import 'package:app_plataforma/src/shared/valor/models/mapper/valor_average_mapper.dart';
import 'package:dartz/dartz.dart';

class ValorGlucosaAdapter extends ValorGlucosaRepository {

  final ValorGlucosaRemoteDataSource remote;
  final AuthRepository local;
  final ValorGlucosaMapper mapper;
  final ValorAverageMapper averageMapper;
  
  ValorGlucosaAdapter({
    required this.remote,
    required this.local,
    required this.mapper,
    required this.averageMapper
  });

  @override
  Future<Either<Exception, List<ValorGlucosaResponse>>> buscarValoresGlucosaDelDia(String fecha) async {

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {
              final response = await remote.buscarValoresDelDia(folio, fecha);

              return response.fold(
                      (failure) => Left(failure),
                      (valores) => Right(valores.map((model) => mapper.toValorGlucosaResponse(model)).toList())
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

  @override
  Future<Either<Exception, ValorAverage>> promedioGlucosa() async {

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

              final response = await remote.buscarPromedioGlucosa(folio);

              return response.fold(
                      (failure) => Left(failure),
                      (average) => Right(averageMapper.toValorAverage(average))
              );
            }
    );
  }

}