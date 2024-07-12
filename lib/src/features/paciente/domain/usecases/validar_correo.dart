import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class ValidarCorreo extends UseCase<bool, String> {

  final PacienteRepository _repository;

  ValidarCorreo(this._repository);

  @override
  Future<Either<Exception, bool>> call(String params) async =>
      _repository.validarCorreo(params);

}