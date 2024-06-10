class PacientePassword {

  late final String idPaciente;
  final String hashActual;
  final String hashNuevo;

  PacientePassword({
    required this.idPaciente,
    required this.hashActual,
    required this.hashNuevo
  });

}