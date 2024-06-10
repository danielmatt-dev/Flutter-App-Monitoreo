import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/repositories/registro_respuestas_repository.dart';

class GuardarRespuestaEnLista {

  final RegistroRespuestasRepository repository;

  GuardarRespuestaEnLista(this.repository);

  void call(RegistroRespuestas params) => repository.ingresarRegistro(params);

}

// <>