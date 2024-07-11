import 'package:app_plataforma/src/features/valor/domain/entities/valor_response.dart';
import 'package:app_plataforma/src/features/valor/domain/repositories/valor_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class BuscarValoresPresion extends UseCase<List<ValorResponse>, String> {

  final ValorRepository repository;

  BuscarValoresPresion(this.repository);

  @override
  Future<Either<Exception, List<ValorResponse>>> call(String params) async =>
      await repository.buscarValoresDelDia(params);

}
