import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/repositories/valor_presion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class IngresarValorPresion extends UseCase<bool, ValorPresionRequest>{

  final ValorPresionRepository repository;

  IngresarValorPresion(this.repository);

  @override
  Future<Either<Exception, bool>> call(ValorPresionRequest params) async =>
      repository.ingresarValorPresion(params);

}