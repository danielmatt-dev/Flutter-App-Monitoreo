import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/sqflite/configuracion_local_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/remote/configuracion_remote_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/mapper/configuracion_mediciones_model_mapper.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/entities/configuracion_mediciones.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/repositories/configuracion_mediciones_repository.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/data_sources/local/valor_glucosa_local_datasource.dart';
import 'package:dartz/dartz.dart';

class ConfiguracionMedicionesAdapter extends ConfiguracionMedicionesRepository {

  final ConfiguracionRemoteDatasource remote;
  final ConfiguracionLocalDatasource local;
  final ValorGlucosaLocalDatasource valorGlucosaLocalDatasource;
  final ConfiguracionMedicionesModelMapper mapper;

  ConfiguracionMedicionesAdapter({
    required this.remote,
    required this.local,
    required this.valorGlucosaLocalDatasource,
    required this.mapper
  });

  @override
  Future<Either<Exception, ConfiguracionMediciones>> buscarMedicionesDelDia() async {

    final response = await remote.buscarConfiguracion(valorGlucosaLocalDatasource.getIdPaciente());

    return response.fold(
            (failure) => Left(failure),
            (model) async {

              final success = await local.clearTable();

              if(success.isLeft()){
                return Left(Exception('Error al eliminar los registros de la tabla'));
              }

              final result = await local.saveConfiguracion(model);

              if(result.isLeft()){
                return Left(Exception('Error al guardar las mediciones del paciente'));
              }

              return Right(mapper.toConfiguracionMediciones(model));

            }
    );

  }

}