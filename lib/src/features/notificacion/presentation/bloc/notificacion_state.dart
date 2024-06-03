part of 'notificacion_bloc.dart';

// <>
abstract class NotificacionState {
  const NotificacionState();
}

class NotificacionInicial extends NotificacionState {}

/* Estado para manejar el estado al obtener Notificacion */

// Cargando notificaciones
class NotificacionLoading extends NotificacionState {}

// Notificaciones cargadas
class ListaNotificacionesSuccess extends NotificacionState {

  final List<Notificacion> notificaciones;

  ListaNotificacionesSuccess(this.notificaciones);

}

// Notificación por id cargada
class NotificacionSuccess extends NotificacionState {

  final Notificacion notificacion;

  NotificacionSuccess(this.notificacion);

}

// Error al cargar notificaciones
class NotificacionError extends NotificacionState {

  final String error;

  NotificacionError(this.error);

}
