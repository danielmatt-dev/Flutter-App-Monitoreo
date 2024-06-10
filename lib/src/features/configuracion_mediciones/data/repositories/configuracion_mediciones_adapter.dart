import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/sqflite/configuracion_local_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/remote/configuracion_remote_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/mapper/configuracion_mediciones_mapper.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/entities/configuracion_mediciones.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/repositories/configuracion_mediciones_repository.dart';
import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ConfiguracionMedicionesAdapter extends ConfiguracionMedicionesRepository {

  final ConfiguracionRemoteDatasource remote;
  final ConfiguracionLocalDatasource local;
  final AuthRepository repository;
  final ConfiguracionMedicionesMapper mapper;

  ConfiguracionMedicionesAdapter({
    required this.remote,
    required this.local,
    required this.repository,
    required this.mapper
  });

  @override
  Future<Either<Exception, ConfiguracionMediciones>> buscarMedicionesDelDia() async {

    return repository.getIdPaciente().fold(
            (failure) => Left(failure),
            (idPaciente) async {

              final response = await remote.buscarConfiguracion(idPaciente);

              return response.fold(
                      (failure) => Left(failure),
                      (model) async {

                        await local.clearTable();
                        await local.saveConfiguracion(model);
                        return Right(mapper.toConfiguracionMediciones(model));
                      }
              );

            }
    );

  }

}