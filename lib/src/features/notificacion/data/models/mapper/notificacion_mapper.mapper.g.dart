// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacion_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class NotificacionMapperImpl extends NotificacionMapper {
  NotificacionMapperImpl() : super();

  @override
  NotificacionModel toNotificacionModel(Notificacion notificacion) {
    final notificacionmodel = NotificacionModel(
      idNotificacion: notificacion.idNotificacion,
      titulo: notificacion.titulo,
      descripcion: notificacion.descripcion,
      tipo: notificacion.tipo,
    );
    return notificacionmodel;
  }

  @override
  Notificacion toNotificacion(NotificacionModel model) {
    final notificacion = Notificacion(
      idNotificacion: model.idNotificacion,
      titulo: model.titulo,
      descripcion: model.descripcion,
      tipo: model.tipo,
    );
    return notificacion;
  }
}
