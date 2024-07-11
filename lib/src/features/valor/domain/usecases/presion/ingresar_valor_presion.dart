import 'package:app_plataforma/src/features/valor/domain/entities/impl/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor/domain/repositories/valor_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class IngresarValorPresion extends UseCase<bool, ValorPresionRequest>{

  final ValorRepository repository;

  IngresarValorPresion(this.repository);

  @override
  Future<Either<Exception, bool>> call(ValorPresionRequest params) async =>
      await repository.ingresarValor(params);

}