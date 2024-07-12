class RegistroRequest {

  final String fcmToken;
  final List<RegistroRespuestas> respuestas;

  RegistroRequest({
    required this.fcmToken,
    required this.respuestas
  });

}

class RegistroRespuestas {

  final int idPregunta;
  final String descripcionPregunta;
  final String tipo;
  final String respuesta;
  final int puntaje;

  RegistroRespuestas({
    required this.idPregunta,
    required this.descripcionPregunta,
    required this.tipo,
    required this.respuesta,
    required this.puntaje
  });

  @override
  String toString() {
    return 'RegistroRespuestas{idPregunta: $idPregunta, descripcionPregunta: $descripcionPregunta, respuesta: $respuesta, puntaje: $puntaje}';
  }

}