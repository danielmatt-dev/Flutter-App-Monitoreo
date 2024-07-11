import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class BuscarUsuario extends UseCase<String, NoParams>{

  final AuthRepository repository;

  BuscarUsuario(this.repository);

  @override
  Future<Either<Exception, String>> call(NoParams params) async => repository.getUsuario();

}