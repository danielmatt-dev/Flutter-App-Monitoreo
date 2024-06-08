class ValorPresionResponse {

  final int folio;
  final String fecha;
  final String hora;
  final int valorSistolica;
  final int valorDiastolica;
  final String nivel;
  final String medicion;
  final String notas;

  ValorPresionResponse({
    required this.folio,
    required this.fecha,
    required this.hora,
    required this.valorSistolica,
    required this.valorDiastolica,
    required this.nivel,
    required this.medicion,
    required this.notas
  });

}