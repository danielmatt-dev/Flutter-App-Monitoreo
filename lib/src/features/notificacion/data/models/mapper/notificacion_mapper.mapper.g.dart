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
      idNotificacion: model.idNotificacion,
      titulo: model.titulo,
      descripcion: model.descripcion,
      tipo: model.tipo,
    );
    return notificacion;
  }
}
