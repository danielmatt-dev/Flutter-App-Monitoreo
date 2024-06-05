import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/repositories/valor_glucosa_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class IngresarValorGlucosa extends UseCase<bool, ValorGlucosaRequest>{

  final ValorGlucosaRepository repository;

  IngresarValorGlucosa(this.repository);

  @override
  Future<Either<Exception, bool>> call(ValorGlucosaRequest params) =>
      repository.ingresarValorGlucosa(params);

}
