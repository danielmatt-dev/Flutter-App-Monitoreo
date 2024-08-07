import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/mediciones/data/data_sources/remote/medicion_remote_datasource.dart';
import 'package:app_plataforma/src/features/mediciones/data/models/mapper/medicion_mapper.dart';
import 'package:app_plataforma/src/features/mediciones/domain/entities/medicion.dart';
import 'package:app_plataforma/src/features/mediciones/domain/repositories/medicion_repository.dart';
import 'package:dartz/dartz.dart';

class MedicionAdapter extends MedicionRepository {

  final MedicionRemoteDatasource remote;
  final AuthRepository repository;
  final MedicionMapper mapper;
  final AuthRepository local;

  MedicionAdapter({
    required this.remote,
    required this.repository,
    required this.mapper,
    required this.local
  });

  @override
  Future<Either<Exception, List<Medicion>>> buscarMedicionesDelDia(String tipo) async {

    return repository.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

              final response = await remote.buscarConfiguracion(folio, tipo, local.getToken());

              return response.fold(
                      (failure) => Left(failure),
                      (models)  => Right(models.map((model) => mapper.toMedicion(model)).toList())
              );

            }
    );

  }

}