// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respuesta_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class RespuestaMapperImpl extends RespuestaMapper {
  RespuestaMapperImpl() : super();

  @override
  Respuesta toRespuesta(RespuestaModel model) {
    final respuesta = Respuesta(
      idRespuesta: model.idRespuesta,
      descripcion: model.descripcion,
      puntaje: model.puntaje,
    );
    return respuesta;
  }
}
