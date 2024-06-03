import 'package:app_plataforma/src/features/paciente/domain/entities/paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarPacientePorId extends UseCase<Paciente, String> {

  final PacienteRepository repository;

  BuscarPacientePorId(this.repository);

  @override
  Future<Either<Exception, Paciente>> call(String params) =>
      repository.buscarPaciente(params);

}

// <>