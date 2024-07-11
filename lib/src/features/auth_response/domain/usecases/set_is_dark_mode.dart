import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class SetIsDarkMode extends UseCase<bool, bool> {

  final AuthRepository repository;

  SetIsDarkMode(this.repository);

  @override
  Future<Either<Exception, bool>> call(bool params) async => repository.setIsDarkMode(params);

}