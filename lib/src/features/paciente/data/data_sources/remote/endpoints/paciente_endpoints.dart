import 'package:app_plataforma/src/shared/utils/base_url.dart';

class PacienteEndpoints{

  static const findPacienteById = '$baseUrl/pacientes/';
  static const login = '$baseUrl/autenticacion/paciente/login';
  static const signup = '$baseUrl/autenticacion/paciente/registro';
  static const updatePaciente = '$baseUrl/pacientes/actualizar';

}