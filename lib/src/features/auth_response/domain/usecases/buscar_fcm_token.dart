import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarFcmToken {

  final AuthRepository _repository;

  BuscarFcmToken(this._repository);

  Future<String> call(NoParams params) async => _repository.getFcmToken();

}