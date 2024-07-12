import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class ReestablecerPassword extends UseCase<bool, Usuario> {

  final PacienteRepository _repository;

  ReestablecerPassword(this._repository);

  @override
  Future<Either<Exception, bool>> call(Usuario params) async =>
      _repository.reestablecerPassword(params);

}