import 'package:app_plataforma/src/features/paciente/data/models/paciente_model.dart';
import 'package:smartstruct/smartstruct.dart';
import '../../../domain/entities/paciente.dart';

part 'paciente_mapper.mapper.g.dart';

@Mapper()
abstract class PacienteMapper {

  PacienteModel toPacienteModel(Paciente paciente);

  Paciente toPaciente(PacienteModel model);

}