import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/local/configuracion_local_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/data_sources/remote/configuracion_remote_datasource.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/mapper/configuracion_mediciones_model_mapper.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/entities/configuracion_mediciones.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/repositories/configuracion_mediciones_repository.dart';
import 'package:dartz/dartz.dart';

class ConfiguracionMedicionesAdapter extends ConfiguracionMedicionesRepository {

  final ConfiguracionRemoteDatasource remote;
  final ConfiguracionLocalDatasource local;
  final ConfiguracionMedicionesModelMapper mapper;

  ConfiguracionMedicionesAdapter({
    required this.remote,
    required this.local,
    required this.mapper
  });

  @override
  Future<Either<Exception, ConfiguracionMediciones>> buscarMedicionesDelDia(String idPaciente) async {

    final response = await remote.buscarConfiguracion(idPaciente);

    return response.fold(
            (failure) async => Left(failure),
            (model) async {



              return Right(mapper.toConfiguracionMedicionesModel(model));
            }
    );

  }

}