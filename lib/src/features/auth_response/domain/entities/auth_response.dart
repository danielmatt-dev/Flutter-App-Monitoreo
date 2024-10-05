class AuthResponse {

  final String idPaciente;
  final String usuario;
  final String correo;
  final String token;
  final DateTime fechaExpiracion;

  AuthResponse({
    required this.idPaciente,
    required this.usuario,
    required this.correo,
    required this.token,
    required this.fechaExpiracion
  });

}