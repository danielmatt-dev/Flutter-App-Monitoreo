import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/promedio/data/data_sources/remote/promedio_remote_datasource.dart';
import 'package:app_plataforma/src/features/promedio/data/models/mapper/promedio_mapper.dart';
import 'package:app_plataforma/src/features/promedio/domain/entities/promedio.dart';
import 'package:app_plataforma/src/features/promedio/domain/repositories/promedio_repository.dart';
import 'package:dartz/dartz.dart';

class PromedioAdapter extends PromedioRepository {

  final PromedioRemoteDatasource remote;
  final PromedioMapper mapper;
  final AuthRepository local;

  PromedioAdapter({
    required this.remote,
    required this.local,
    required this.mapper
  });

  @override
  Future<Either<Exception, Promedio>> promedioDiastolica() async {

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

          final response = await remote.buscarPromedioDiastolica(folio);

          return response.fold(
                  (failure) => Left(failure),
                  (average) => Right(mapper.toPromedio(average))
          );

        }
    );

  }

  @override
  Future<Either<Exception, Promedio>> promedioGlucosa() async {

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

          final response = await remote.buscarPromedioGlucosa(folio);

          return response.fold(
                  (failure) => Left(failure),
                  (average) => Right(mapper.toPromedio(average))
          );
        }
    );

  }

  @override
  Future<Either<Exception, Promedio>> promedioSistolica() async {

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async  {

          final response = await remote.buscarPromedioSistolica(folio);

          return response.fold(
                  (failure) => Left(failure),
                  (average) => Right(mapper.toPromedio(average))
          );

        }
    );

  }

}