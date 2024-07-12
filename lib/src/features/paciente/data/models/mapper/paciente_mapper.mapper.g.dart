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
      rmb: model.rmb,
      telefono: model.telefono,
      correo: model.correo,
      factorActividad: model.factorActividad,
      nombreTratamiento: model.nombreTratamiento,
      tipoTratamiento: model.tipoTratamiento,
      claveDoctor: model.claveDoctor,
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
      telefono: request.telefono,
      correo: request.correo,
      password: request.password,
      factorActividad: request.factorActividad,
      claveDoctor: request.claveDoctor,
      nombreTratamiento: request.nombreTratamiento,
      sensacionCorporal: toRegistroRespuestasModel(request.sensacionCorporal),
      visionBorrosa: toRegistroRespuestasModel(request.visionBorrosa),
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
      telefono: request.telefono,
      correo: request.correo,
      factorActividad: request.factorActividad,
    );
    return pacienteupdaterequestmodel;
  }

  @override
  PacientePasswordModel toPacientePasswordModel(
      PacientePassword pacientePassword) {
    final pacientepasswordmodel = PacientePasswordModel(
      currentPassword: pacientePassword.currentPassword,
      newPassword: pacientePassword.newPassword,
    );
    return pacientepasswordmodel;
  }

  @override
  UsuarioModel toUsuarioModel(Usuario usuario) {
    final usuariomodel = UsuarioModel(
      correo: usuario.correo,
      password: usuario.password,
    );
    return usuariomodel;
  }

  @override
  RegistroRespuestasModel toRegistroRespuestasModel(
      RegistroRespuestas respuestas) {
    final registrorespuestasmodel = RegistroRespuestasModel(
      idPregunta: respuestas.idPregunta,
      descripcionPregunta: respuestas.descripcionPregunta,
      tipo: respuestas.tipo,
      respuesta: respuestas.respuesta,
      puntaje: respuestas.puntaje,
    );
    return registrorespuestasmodel;
  }
}
