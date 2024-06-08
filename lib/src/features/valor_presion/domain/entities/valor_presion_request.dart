class ValorPresionRequest {

  final String idPaciente;
  final int valorSistolica;
  final int valorDiastolica;
  final String medicion;
  final String notas;

  ValorPresionRequest({
    required this.idPaciente,
    required this.valorSistolica,
    required this.valorDiastolica,
    required this.medicion,
    required this.notas
  });

}