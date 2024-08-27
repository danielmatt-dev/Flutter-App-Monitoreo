import 'package:app_plataforma/src/features/tratamiento/data/models/mapper/tratamiento_mapper.dart';
import 'package:app_plataforma/src/features/tratamiento/data/models/tratamiento_model.dart';
import 'package:app_plataforma/src/features/tratamiento/data/models/tratamiento_paciente_model.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento_paciente.dart';

class TratamientoMapperImpl extends TratamientoMapper {

  TratamientoMapperImpl() : super();

  @override
  Tratamiento toTratamiento(TratamientoModel model) {
    final tratamiento = Tratamiento(
      idTratamiento: model.idTratamiento,
      nombre: model.nombre,
      tipo: model.tipo,
    );
    return tratamiento;
  }

  @override
  TratamientoModel toTratamientoModel(Tratamiento entity) {
    final tratamientomodel = TratamientoModel(
      idTratamiento: entity.idTratamiento,
      nombre: entity.nombre,
      tipo: entity.tipo,
    );
    return tratamientomodel;
  }

  @override
  TratamientoPacienteModel toTratamientoPacienteModel(
      TratamientoPaciente entity) {
    final tratamientopacientemodel = TratamientoPacienteModel(
        tratamientos: entity.tratamientos.map((tratamiento) =>
            toTratamientoModel(tratamiento)).toList());
    return tratamientopacientemodel;
  }

  @override
  TratamientoPaciente toTratamientoPaciente(TratamientoPacienteModel model) {
    final tratamientopaciente = TratamientoPaciente(
        tratamientos: model.tratamientos.map((x) => toTratamiento(x)).toList());
    return tratamientopaciente;
  }
}
