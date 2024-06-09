import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/configuracion_mediciones_model.dart';
import 'package:dartz/dartz.dart';

abstract class ConfiguracionLocalDatasource {

  Future<Either<Exception, int>> saveConfiguracion(ConfiguracionMedicionesModel model);

  Future<Either<Exception, int>> deleteConfiguracion(int idConfiguracion);

  Future<Either<Exception, int>> findIdConfiguracion();

  Future<Either<Exception, bool>> clearTable();

}

// <>