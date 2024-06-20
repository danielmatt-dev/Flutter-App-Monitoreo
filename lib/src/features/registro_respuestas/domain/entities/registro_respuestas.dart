class RegistroRespuestas {

  late final int folio;
  final String idPregunta;
  final String descripcionPregunta;
  final String respuesta;
  final int puntaje;

  RegistroRespuestas({
    this.folio = 0,
    required this.idPregunta,
    required this.descripcionPregunta,
    required this.respuesta,
    required this.puntaje
  });

}