import 'package:app_plataforma/src/shared/utils/base_url.dart';

class PacienteEndpoints{

  static const login = '$baseUrl/autenticacion/pacientes';
  static const signup = '$baseUrl/autenticacion/pacientes/registro';

  static const updatePaciente = '$baseUrl/autenticacion/pacientes';
  static const updatePassword = '$baseUrl/autenticacion/pacientes';

  static const validateEmail = '$baseUrl/autenticacion/pacientes/';
  static const resetPassword = '$baseUrl/autenticacion/pacientes/';

  static const findPacienteById = '$baseUrl/pacientes/';
  static const deletePaciente = '$baseUrl/pacientes/';

}