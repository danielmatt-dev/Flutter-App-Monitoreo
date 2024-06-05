class ValorGlucosaRequest {

  final String idPaciente;
  final int valor;
  final String medicion;
  final String notas;

  ValorGlucosaRequest({
    required this.idPaciente,
    required this.valor,
    required this.medicion,
    required this.notas
  });

}