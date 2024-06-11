import 'package:app_plataforma/src/features/valor_presion/domain/repositories/valor_presion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:app_plataforma/src/shared/valor/entities/valor_average.dart';
import 'package:dartz/dartz.dart';

class BuscarPromedioDiastolica extends UseCase<ValorAverage, NoParams>{

  final ValorPresionRepository repository;

  BuscarPromedioDiastolica(this.repository);

  @override
  Future<Either<Exception, ValorAverage>> call(NoParams params) async =>
      await repository.buscarPromedioDiastolica();

}