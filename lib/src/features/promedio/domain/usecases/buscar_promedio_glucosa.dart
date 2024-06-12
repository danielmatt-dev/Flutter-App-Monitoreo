import 'package:app_plataforma/src/features/promedio/domain/entities/promedio.dart';
import 'package:app_plataforma/src/features/promedio/domain/repositories/promedio_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarPromedioGlucosa extends UseCase<Promedio, NoParams>{

  final PromedioRepository repository;

  BuscarPromedioGlucosa(this.repository);

  @override
  Future<Either<Exception, Promedio>> call(NoParams params) async =>
      await repository.promedioGlucosa();

}

// <>