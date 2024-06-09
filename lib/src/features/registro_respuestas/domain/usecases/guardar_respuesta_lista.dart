import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';

class GuardarRespuestaEnLista {

  final List<RegistroRespuestas> respuestas;

  GuardarRespuestaEnLista(this.respuestas);

  void call(RegistroRespuestas params) {
      respuestas.add(params);
  }

}

// <>