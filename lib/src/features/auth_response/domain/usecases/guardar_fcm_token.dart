import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class GuardarFcmToken extends UseCase<bool, String> {

  final AuthRepository _repository;

  GuardarFcmToken(this._repository);

  @override
  Future<Either<Exception, bool>> call(String params) async => _repository.setToken(params);

}