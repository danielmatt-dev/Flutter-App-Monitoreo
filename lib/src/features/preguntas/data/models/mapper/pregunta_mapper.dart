import 'package:app_plataforma/src/features/preguntas/data/models/pregunta_model.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';

abstract class PreguntaMapper {

  Pregunta toPregunta(PreguntaModel model);

  List<Pregunta> toListaPreguntas(List<PreguntaModel> models);

}

// <>