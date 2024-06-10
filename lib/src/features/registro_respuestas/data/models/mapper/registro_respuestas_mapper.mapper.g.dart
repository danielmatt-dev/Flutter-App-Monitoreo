// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_respuestas_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class RegistroRespuestasMapperImpl extends RegistroRespuestasMapper {
  RegistroRespuestasMapperImpl() : super();

  @override
  RegistroRespuestasModel toRegistroRespuestasModel(
      RegistroRespuestas respuestas) {
    final registrorespuestasmodel = RegistroRespuestasModel(
      folio: respuestas.folio,
      idPregunta: respuestas.idPregunta,
      respuesta: respuestas.respuesta,
      puntaje: respuestas.puntaje,
    );
    return registrorespuestasmodel;
  }
}
