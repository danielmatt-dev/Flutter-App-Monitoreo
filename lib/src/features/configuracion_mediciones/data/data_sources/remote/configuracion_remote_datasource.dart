import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/configuracion_mediciones_model.dart';
import 'package:dartz/dartz.dart';

abstract class ConfiguracionRemoteDatasource {

  Future<Either<Exception, ConfiguracionMedicionesModel>> buscarConfiguracion(String idPaciente);

}

// <>