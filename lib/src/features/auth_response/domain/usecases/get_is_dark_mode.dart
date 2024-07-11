import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class GetIsDarkMode extends UseCase<bool, NoParams> {

  final AuthRepository repository;

  GetIsDarkMode(this.repository);

  @override
  Future<Either<Exception, bool>> call(NoParams params) async => repository.isDarkMode();

}