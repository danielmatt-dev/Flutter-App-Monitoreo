import 'package:app_plataforma/src/shared/utils/base_url.dart';

class PacienteEndpoints{

  static const findPacienteById = '$baseUrl/pacientes/';
  static const login = '$baseUrl/autenticacion/paciente/login_signup';
  static const signup = '$baseUrl/autenticacion/paciente/registro';
  static const updatePaciente = '$baseUrl/pacientes/actualizar';
  static const updatePassword = '$baseUrl/autenticacion/paciente/update';
  static const validateEmail = '$baseUrl/validar';
  static const resetPassword = '$baseUrl/reset';

}