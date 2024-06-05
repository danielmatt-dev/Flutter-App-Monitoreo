import 'package:smartstruct/smartstruct.dart';
import '../../../domain/entities/paciente.dart';
import '../paciente_model.dart';

part 'paciente_mapper.mapper.g.dart';

@Mapper()
abstract class PacienteMapper {

  PacienteModel toPacienteModel(Paciente paciente);

  Paciente toPaciente(PacienteModel model);

}