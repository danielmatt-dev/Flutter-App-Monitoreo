class AuthResponse {

  final String idPaciente;
  final String token;
  final DateTime fechaExpiracion;

  AuthResponse({
    required this.idPaciente,
    required this.token,
    required this.fechaExpiracion
  });

}