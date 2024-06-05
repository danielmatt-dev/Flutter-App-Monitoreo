import 'package:dartz/dartz.dart';
import '../entities/paciente.dart';

abstract class PacienteRepository {

  Future<Either<Exception, Paciente>> buscarPaciente(String idPaciente);



}
