import 'package:app_plataforma/src/features/configuracion_mediciones/domain/entities/configuracion_mediciones.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/repositories/configuracion_mediciones_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GuardarMedicionesDelDia extends UseCase<bool, ConfiguracionMediciones> {

  final ConfiguracionMedicionesRepository _repository;

  GuardarMedicionesDelDia(this._repository);

  @override
  Future<Either<Exception, bool>> call(ConfiguracionMediciones params) async =>
      _repository.guardarMediciones(params);

}

// <>