import 'package:app_plataforma/src/features/preguntas/data/models/mapper/pregunta_mapper.dart';
import 'package:app_plataforma/src/features/preguntas/data/models/mapper/respuesta_mapper.dart';
import 'package:app_plataforma/src/features/preguntas/data/models/pregunta_model.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';

class PreguntaMapperImpl extends PreguntaMapper {

  final RespuestaMapper mapper;

  PreguntaMapperImpl(this.mapper);

  @override
  List<Pregunta> toListaPreguntas(List<PreguntaModel> models) =>
      models.map((model) => toPregunta(model)).toList();

  @override
  Pregunta toPregunta(PreguntaModel model) =>
      Pregunta(
          idPregunta: model.idPregunta,
          pregunta: model.pregunta,
          respuestas: model.respuestas.map((r) => mapper.toRespuesta(r)).toList()
      );

}