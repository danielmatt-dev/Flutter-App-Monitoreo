import 'package:app_plataforma/src/features/configuracion_mediciones/domain/entities/configuracion_mediciones.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/repositories/configuracion_mediciones_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarMedicionesDelDia extends UseCase<ConfiguracionMediciones, String> {

  final ConfiguracionMedicionesRepository repository;

  BuscarMedicionesDelDia(this.repository);

  @override
  Future<Either<Exception, ConfiguracionMediciones>> call(String params) async =>
      repository.buscarMedicionesDelDia(params);

}