import 'package:app_plataforma/src/features/tratamiento/data/models/tratamiento_model.dart';
import 'package:app_plataforma/src/features/tratamiento/data/models/tratamiento_paciente_model.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento_paciente.dart';

abstract class TratamientoMapper {

  Tratamiento toTratamiento(TratamientoModel model);

  TratamientoModel toTratamientoModel(Tratamiento entity);

  TratamientoPacienteModel toTratamientoPacienteModel(TratamientoPaciente entity);

  TratamientoPaciente toTratamientoPaciente(TratamientoPacienteModel model);

}
