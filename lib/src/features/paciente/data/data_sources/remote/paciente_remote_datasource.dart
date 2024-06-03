import 'package:app_plataforma/src/features/paciente/data/models/paciente_model.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class PacienteRemoteDatasource {

  Future<Either<Exception, PacienteModel>> buscarPacientePorId(String idPaciente);

}