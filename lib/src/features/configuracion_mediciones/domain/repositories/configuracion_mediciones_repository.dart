import 'package:app_plataforma/src/features/configuracion_mediciones/domain/entities/configuracion_mediciones.dart';
import 'package:dartz/dartz.dart';

abstract class ConfiguracionMedicionesRepository {

  Future<Either<Exception, ConfiguracionMediciones>> buscarMedicionesDelDia();

}

// <>