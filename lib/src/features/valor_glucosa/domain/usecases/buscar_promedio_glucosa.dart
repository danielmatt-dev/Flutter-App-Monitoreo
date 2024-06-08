import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarPromedioGlucosa extends UseCase<double, int>{

  final ValorGlucosaRepository repository;

  BuscarPromedioGlucosa(this.repository);

  @override
  Future<Either<Exception, double>> call(int params) async => await repository.promedioGlucosa(params);

}

// <>