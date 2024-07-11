abstract class ValorResponseModel {

  final int folio;
  final String fecha;
  final String hora;
  final String color;
  final String medicion;
  final String notas;

  ValorResponseModel({
    required this.folio,
    required this.fecha,
    required this.hora,
    required this.color,
    required this.medicion,
    required this.notas
  });

}