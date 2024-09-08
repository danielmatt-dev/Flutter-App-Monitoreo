import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/valor/data/data_sources/remote/valor_remote_datasource.dart';
import 'package:app_plataforma/src/features/valor/data/models/mapper/valor_mapper.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/impl/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/promedio.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_request.dart';
import 'package:app_plataforma/src/features/valor/domain/repositories/valor_repository.dart';
import 'package:app_plataforma/src/features/valor/data/models/mapper/valor_response_mapper.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_response.dart';
import 'package:dartz/dartz.dart';
import 'package:open_file/open_file.dart' as open_file;

class ValorPresionAdapter extends ValorRepository {

  final ValorRemoteDataSource remote;
  final ValorMapper mapper;
  final AuthRepository local;
  final ValorResponseMapper responseMapper;
  
  ValorPresionAdapter({
    required this.remote,
    required this.mapper,
    required this.local,
    required this.responseMapper
  });

  @override
  Future<Either<Exception, List<ValorResponse>>> buscarValoresDelDia(String fecha) async {

    local.setFolio(1);

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

              final response = await remote.buscarValoresDelDia(folio, fecha, local.getToken());

              return response.fold(
                      (failure) => Left(failure),
                      (models) => Right(models.map((model) => responseMapper.toValorResponse(model)).toList())
              );

            }
    );

  }

  @override
  Future<Either<Exception, bool>> ingresarValor(ValorRequest request) async {

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

              request as ValorPresionRequest;
              final model = mapper.toValorPresionRequestModel(request);
              model.folio = folio;

              final response = await remote.ingresarValor(model, local.getToken());

              return response.fold(
                      (failure) => Left(failure),
                      (r) => Right(r)
              );
            }
            );

  }

  @override
  Future<Either<Exception, bool>> generarPdf(int rango) async {

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

              final response = await remote.generarPdf(folio, rango, local.getToken());

              return response.fold(
                      (failure) => Left(failure),
                      (file) async {

                        final result = await open_file.OpenFile.open(file.path);

                        if (result.message != 'done') {
                          return Left(Exception('Error al abrir el archivo: ${result.message}'));
                        }

                        return const Right(true);
                      }
                      );
            }
            );
  }

  @override
  Future<Either<Exception, Promedio>> buscarPromedio(String tipo) async {
    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

          final response = await remote.buscarPromedio(folio, tipo, local.getToken());

          return response.fold(
                  (failure) => Left(failure),
                  (average) => Right(mapper.toPromedio(average))
          );
        }
    );
  }

}