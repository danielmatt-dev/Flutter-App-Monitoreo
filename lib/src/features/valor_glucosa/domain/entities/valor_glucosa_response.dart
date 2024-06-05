class ValorGlucosaResponse {

  final int folio;
  final String fecha;
  final String hora;
  final int valor;
  final String nivel;
  final String medicion;
  final String notas;

  ValorGlucosaResponse({
    required this.folio,
    required this.fecha,
    required this.hora,
    required this.valor,
    required this.nivel,
    required this.medicion,
    required this.notas
  });

}