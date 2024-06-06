import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarPacientePorId extends UseCase<PacienteResponse, String> {

  final PacienteRepository repository;

  BuscarPacientePorId(this.repository);

  @override
  Future<Either<Exception, PacienteResponse>> call(String params) =>
      repository.buscarPaciente(params);

}

// <>