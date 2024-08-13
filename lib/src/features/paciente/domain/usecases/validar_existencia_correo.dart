import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class ValidarExistenciaCorreo extends UseCase<bool, String> {

  final PacienteRepository _repository;

  ValidarExistenciaCorreo(PacienteRepository repository): _repository = repository;

  @override
  Future<Either<Exception, bool>> call(String params) =>
      _repository.validarExistenciaCorreo(params);

}