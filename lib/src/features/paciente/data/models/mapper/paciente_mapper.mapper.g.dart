// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paciente_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class PacienteMapperImpl extends PacienteMapper {
  PacienteMapperImpl() : super();

  @override
  PacienteResponseModel toPacienteModel(PacienteResponse response) {
    final pacienteresponsemodel = PacienteResponseModel(
      folio: response.folio,
      nombre: response.nombre,
      apellidoPaterno: response.apellidoPaterno,
      apellidoMaterno: response.apellidoMaterno,
      fechaNacimiento: response.fechaNacimiento,
      genero: response.genero,
      estadoCivil: response.estadoCivil,
      nivelEstudios: response.nivelEstudios,
      numMiembrosHogar: response.numMiembrosHogar,
      tipoDiabetes: response.tipoDiabetes,
      tiempoDiabetes: response.tiempoDiabetes,
      peso: response.peso,
      talla: response.talla,
      imc: response.imc,
      rmd: response.rmd,
      correo: response.correo,
      nombreDoctor: response.nombreDoctor,
      especialidadDoctor: response.especialidadDoctor,
      telefonoDoctor: response.telefonoDoctor,
      correoDoctor: response.correoDoctor,
    );
    return pacienteresponsemodel;
  }

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
      correo: request.correo,
      password: request.password,
      factorActividad: request.factorActividad,
      claveDoctor: request.claveDoctor,
      nombreTratamiento: request.nombreTratamiento,
    );
    return pacienterequestmodel;
  }

  @override
  PacienteRequest toPacienteRequest(PacienteRequestModel model) {
    final pacienterequest = PacienteRequest(
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
      correo: model.correo,
      password: model.password,
      factorActividad: model.factorActividad,
      claveDoctor: model.claveDoctor,
      nombreTratamiento: model.nombreTratamiento,
    );
    return pacienterequest;
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
  Usuario toUsuario(UsuarioModel model) {
    final usuario = Usuario(
      correo: model.correo,
      password: model.password,
    );
    return usuario;
  }

  @override
  AuthResponseModel toAuthResponseModel(AuthResponse response) {
    final authresponsemodel = AuthResponseModel(
      idPaciente: response.idPaciente,
      token: response.token,
      fechaExpiracion: response.fechaExpiracion,
    );
    return authresponsemodel;
  }

  @override
  AuthResponse toAuthResponse(AuthResponseModel model) {
    final authresponse = AuthResponse(
      idPaciente: model.idPaciente,
      token: model.token,
      fechaExpiracion: model.fechaExpiracion,
    );
    return authresponse;
  }
}
