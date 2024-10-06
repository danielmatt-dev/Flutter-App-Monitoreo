import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarFechaExpiracion extends UseCase<DateTime, NoParams> {

  final AuthRepository repository;

  BuscarFechaExpiracion(this.repository);

  @override
  Future<Either<Exception, DateTime>> call(NoParams params) async =>
      repository.getFechaExpiracion();

}