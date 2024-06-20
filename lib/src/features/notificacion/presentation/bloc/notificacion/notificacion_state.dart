part of 'notificacion_bloc.dart';

// <>
abstract class NotificacionState extends Equatable {

  const NotificacionState();

  @override
  List<Object?> get props => [];

}

/* Estado inicial de Notificacion */
class NotificacionInicial extends NotificacionState { }

// Cargando notificaciones
class NotificacionLoading extends NotificacionState { }

// Lista de notificaciones cargadas
class ListaNotificacionesSuccess extends NotificacionState {

  final List<Notificacion> notificaciones;

  const ListaNotificacionesSuccess(this.notificaciones);

  @override
  List<Object?> get props => [notificaciones];

}

// Notificación por id cargada
class NotificacionSuccess extends NotificacionState {

  final Notificacion notificacion;

  const NotificacionSuccess(this.notificacion);

  @override
  List<Object?> get props => [notificacion];

}

// Error al cargar notificaciones
class NotificacionError extends NotificacionState {

  final String error;

  const NotificacionError(this.error);

  @override
  List<Object?> get props => [error];

}
