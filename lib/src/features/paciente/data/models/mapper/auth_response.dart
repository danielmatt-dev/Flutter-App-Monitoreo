import 'package:app_plataforma/src/features/paciente/data/models/auth_response_model.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/auth_response.dart';
import 'package:smartstruct/smartstruct.dart';

part 'auth_response_mapper.mapper.g.dart';

@Mapper()
abstract class AuthResponseMapper {

  AuthResponse toAuthReponse(AuthResponseModel model);

  AuthResponseModel toAuthReponseModel(AuthResponse authResponse);

}