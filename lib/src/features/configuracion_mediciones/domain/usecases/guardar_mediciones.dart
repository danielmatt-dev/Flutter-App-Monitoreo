import 'package:app_plataforma/src/features/configuracion_mediciones/domain/entities/configuracion_mediciones.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/repositories/configuracion_mediciones_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GuardarMediciones extends UseCase<bool, ConfiguracionMediciones> {

  final ConfiguracionMedicionesRepository repository;

  GuardarMediciones(this.repository);

  @override
  Future<Either<Exception, bool>> call(ConfiguracionMediciones params) async =>
      repository.guardarMediciones(params);

}
