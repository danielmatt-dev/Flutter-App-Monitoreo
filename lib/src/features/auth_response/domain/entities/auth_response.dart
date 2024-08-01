class AuthResponse {

  final String idPaciente;
  final String correo;
  final String token;
  final DateTime fechaExpiracion;

  AuthResponse({
    required this.idPaciente,
    required this.correo,
    required this.token,
    required this.fechaExpiracion
  });

}