import 'package:app_plataforma/src/features/paciente/data/models/paciente_password_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_request_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_response_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/paciente_update_request_model.dart';
import 'package:app_plataforma/src/features/paciente/data/models/usuario_model.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_password.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_update_request.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/usuario.dart';
import 'package:smartstruct/smartstruct.dart';

part 'paciente_mapper.mapper.g.dart';

@Mapper()
abstract class PacienteMapper {

  PacienteResponse toPaciente(PacienteResponseModel model);

  PacienteRequestModel toPacienteRequestModel(PacienteRequest request);

  PacienteUpdateRequestModel toPacienteUpdateRequestModel(PacienteUpdateRequest request);

  PacientePasswordModel toPacientePasswordModel(PacientePassword pacientePassword);

  UsuarioModel toUsuarioModel(Usuario usuario);

}