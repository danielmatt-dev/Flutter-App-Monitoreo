// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacion_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class NotificacionMapperImpl extends NotificacionMapper {
  NotificacionMapperImpl() : super();

  @override
  Notificacion toNotificacion(NotificacionModel model) {
    final notificacion = Notificacion(
      titulo: model.titulo,
      descripcion: model.descripcion,
      tipo: model.tipo,
      prioridad: model.prioridad,
    );
    return notificacion;
  }
}
