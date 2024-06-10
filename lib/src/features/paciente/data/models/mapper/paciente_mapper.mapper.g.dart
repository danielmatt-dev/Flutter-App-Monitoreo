// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class PacienteMapperImpl extends PacienteMapper {
  PacienteMapperImpl() : super();

  @override
  PacienteResponse toPaciente(PacienteResponseModel model) {
    final pacienteresponse = PacienteResponse(
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
    return pacienteresponse;
  }

  @override
  PacienteRequestModel toPacienteRequestModel(PacienteRequest request) {
    final pacienterequestmodel = PacienteRequestModel(
      nombre: request.nombre,
      apellidoPaterno: request.apellidoPaterno,
      apellidoMaterno: request.apellidoMaterno,
      fechaNacimiento: request.fechaNacimiento,
      genero: request.genero,
      estadoCivil: request.estadoCivil,
      nivelEstudios: request.nivelEstudios,
      numMiembrosHogar: request.numMiembrosHogar,
      tipoDiabetes: request.tipoDiabetes,
      tiempoDiabetes: request.tiempoDiabetes,
      peso: request.peso,
      talla: request.talla,
      correo: request.correo,
      password: request.password,
      factorActividad: request.factorActividad,
      claveDoctor: request.claveDoctor,
      nombreTratamiento: request.nombreTratamiento,
    );
    return pacienterequestmodel;
  }

  @override
  PacienteUpdateRequestModel toPacienteUpdateRequestModel(
      PacienteUpdateRequest request) {
    final pacienteupdaterequestmodel = PacienteUpdateRequestModel(
      folio: request.folio,
      nombre: request.nombre,
      apellidoPaterno: request.apellidoPaterno,
      apellidoMaterno: request.apellidoMaterno,
      fechaNacimiento: request.fechaNacimiento,
      genero: request.genero,
      estadoCivil: request.estadoCivil,
      nivelEstudios: request.nivelEstudios,
      numMiembrosHogar: request.numMiembrosHogar,
      tipoDiabetes: request.tipoDiabetes,
      tiempoDiabetes: request.tiempoDiabetes,
      peso: request.peso,
      talla: request.talla,
      factorActividad: request.factorActividad,
    );
    return pacienteupdaterequestmodel;
  }

  @override
  UsuarioModel toUsuarioModel(Usuario usuario) {
    final usuariomodel = UsuarioModel(
      correo: usuario.correo,
      password: usuario.password,
    );
    return usuariomodel;
  }
}
