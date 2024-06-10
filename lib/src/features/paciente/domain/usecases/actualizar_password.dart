import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_password.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class ActualizarPassword extends UseCase<bool, PacientePassword> {

  final PacienteRepository repository;

  ActualizarPassword(this.repository);

  @override
  Future<Either<Exception, bool>> call(PacientePassword params) async =>
      await repository.actualizarPassword(params);

}