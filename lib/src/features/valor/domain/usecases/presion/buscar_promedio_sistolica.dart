import 'package:app_plataforma/src/features/valor/domain/entities/promedio.dart';
import 'package:app_plataforma/src/features/valor/domain/repositories/valor_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class BuscarPromedioSistolica extends UseCase<Promedio, String> {

  final ValorRepository repository;

  BuscarPromedioSistolica(this.repository);

  @override
  Future<Either<Exception, Promedio>> call(String params) async =>
      await repository.buscarPromedio(params);

}