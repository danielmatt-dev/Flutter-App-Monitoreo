import 'package:app_plataforma/src/features/paciente/data/models/auth_response_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_request_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_response_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/usuario_model.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/auth_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:smartstruct/smartstruct.dart';

part 'paciente_mapper.mapper.g.dart';

@Mapper()
abstract class PacienteMapper {

  PacienteResponseModel toPacienteModel(PacienteResponse response);

  PacienteResponse toPaciente(PacienteResponseModel model);

  PacienteRequestModel toPacienteRequestModel(PacienteRequest request);

  PacienteRequest toPacienteRequest(PacienteRequestModel model);

  UsuarioModel toUsuarioModel(Usuario usuario);

  Usuario toUsuario(UsuarioModel model);

  AuthResponseModel toAuthResponseModel(AuthResponse response);

  AuthResponse toAuthResponse(AuthResponseModel model);

}