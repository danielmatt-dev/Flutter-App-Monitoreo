// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class AuthResponseMapperImpl extends AuthResponseMapper {
  AuthResponseMapperImpl() : super();

  @override
  AuthResponse toAuthReponse(AuthResponseModel model) {
    final authresponse = AuthResponse(
      idPaciente: model.idPaciente,
      correo: model.correo,
      token: model.token,
      fechaExpiracion: model.fechaExpiracion,
    );
    return authresponse;
  }

  @override
  AuthResponseModel toAuthReponseModel(AuthResponse authResponse) {
    final authresponsemodel = AuthResponseModel(
      idPaciente: authResponse.idPaciente,
      correo: authResponse.correo,
      token: authResponse.token,
      fechaExpiracion: authResponse.fechaExpiracion,
    );
    return authresponsemodel;
  }
}
