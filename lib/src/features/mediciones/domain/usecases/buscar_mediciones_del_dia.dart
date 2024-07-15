import 'package:app_plataforma/src/features/mediciones/domain/entities/medicion.dart';
import 'package:app_plataforma/src/features/mediciones/domain/repositories/medicion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarMedicionesDelDia extends UseCase<List<Medicion>, String> {

  final MedicionRepository repository;

  BuscarMedicionesDelDia(this.repository);

  @override
  Future<Either<Exception, List<Medicion>>> call(String params) async =>
      await repository.buscarMedicionesDelDia(params);

}