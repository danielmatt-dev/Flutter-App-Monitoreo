import 'package:app_plataforma/src/features/paciente/domain/entities/paciente.dart';
import 'package:dartz/dartz.dart';

abstract class PacienteRepository {

  Future<Either<Exception, Paciente>> buscarPaciente(String idPaciente);

}
