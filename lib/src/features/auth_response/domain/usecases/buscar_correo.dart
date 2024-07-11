import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarCorreo extends UseCase<String, NoParams> {

  final AuthRepository repository;

  BuscarCorreo(this.repository);

  @override
  Future<Either<Exception, String>> call(NoParams params) async => repository.getCorreo();

}