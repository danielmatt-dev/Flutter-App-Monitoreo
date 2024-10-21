import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class SetFechaExpiracion extends UseCase<bool, DateTime> {

  final AuthRepository repository;

  SetFechaExpiracion({required this.repository});

  @override
  Future<Either<Exception, bool>> call(DateTime params) =>
      repository.setFechaExpiracion(params);

}