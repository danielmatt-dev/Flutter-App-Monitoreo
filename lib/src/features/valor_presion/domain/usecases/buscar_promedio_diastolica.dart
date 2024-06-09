import 'package:app_plataforma/src/features/valor_presion/domain/repositories/valor_presion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarPromedioDiastolica extends UseCase<double, NoParams>{

  final ValorPresionRepository repository;

  BuscarPromedioDiastolica(this.repository);

  @override
  Future<Either<Exception, double>> call(NoParams params) async =>
      await repository.buscarPromedioDiastolica();

}