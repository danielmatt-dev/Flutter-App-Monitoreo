import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_update_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class ActualizarPaciente extends UseCase<bool, PacienteUpdateRequest>{

  final PacienteRepository repository;

  ActualizarPaciente(this.repository);

  @override
  Future<Either<Exception, bool>> call(PacienteUpdateRequest params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}