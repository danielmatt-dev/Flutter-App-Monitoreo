part of 'notificacion_bloc.dart';

abstract class NotificacionEvent {
  const NotificacionEvent();
}

// Evento para obtener todas las notificaciones
class ObtenerNotificaciones extends NotificacionEvent {}

// Evento para obtener una notificación por id
class ObtenerNotificacionPorId extends NotificacionEvent {

  final int id;

  ObtenerNotificacionPorId(this.id);

}