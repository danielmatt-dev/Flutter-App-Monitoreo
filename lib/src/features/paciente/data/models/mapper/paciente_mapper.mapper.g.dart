// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class PacienteMapperImpl extends PacienteMapper {
  PacienteMapperImpl() : super();

  @override
  PacienteModel toPacienteModel(Paciente paciente) {
    final pacientemodel = PacienteModel(
      folio: paciente.folio,
      nombre: paciente.nombre,
      apellidoPaterno: paciente.apellidoPaterno,
      apellidoMaterno: paciente.apellidoMaterno,
      fechaNacimiento: paciente.fechaNacimiento,
      genero: paciente.genero,
      estadoCivil: paciente.estadoCivil,
      nivelEstudios: paciente.nivelEstudios,
      numMiembrosHogar: paciente.numMiembrosHogar,
      tipoDiabetes: paciente.tipoDiabetes,
      tiempoDiabetes: paciente.tiempoDiabetes,
      peso: paciente.peso,
      talla: paciente.talla,
      imc: paciente.imc,
      rmd: paciente.rmd,
      correo: paciente.correo,
      nombreDoctor: paciente.nombreDoctor,
      especialidadDoctor: paciente.especialidadDoctor,
      telefonoDoctor: paciente.telefonoDoctor,
      correoDoctor: paciente.correoDoctor,
    );
    return pacientemodel;
  }

  @override
  Paciente toPaciente(PacienteModel model) {
    final paciente = Paciente(
      folio: model.folio,
      nombre: model.nombre,
      apellidoPaterno: model.apellidoPaterno,
      apellidoMaterno: model.apellidoMaterno,
      fechaNacimiento: model.fechaNacimiento,
      genero: model.genero,
      estadoCivil: model.estadoCivil,
      nivelEstudios: model.nivelEstudios,
      numMiembrosHogar: model.numMiembrosHogar,
      tipoDiabetes: model.tipoDiabetes,
      tiempoDiabetes: model.tiempoDiabetes,
      peso: model.peso,
      talla: model.talla,
      imc: model.imc,
      rmd: model.rmd,
      correo: model.correo,
      nombreDoctor: model.nombreDoctor,
      especialidadDoctor: model.especialidadDoctor,
      telefonoDoctor: model.telefonoDoctor,
      correoDoctor: model.correoDoctor,
    );
    return paciente;
  }
}
