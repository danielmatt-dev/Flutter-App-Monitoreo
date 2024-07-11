import 'package:app_plataforma/src/features/valor/domain/entities/impl/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor/domain/repositories/valor_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class IngresarValorGlucosa extends UseCase<bool, ValorGlucosaRequest> {

  final ValorRepository repository;

  IngresarValorGlucosa(this.repository);

  @override
  Future<Either<Exception, bool>> call(ValorGlucosaRequest params) async =>
      await repository.ingresarValor(params);

}