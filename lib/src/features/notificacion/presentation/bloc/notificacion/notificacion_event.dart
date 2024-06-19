part of 'notificacion_bloc.dart';

abstract class NotificacionEvent extends Equatable {
  const NotificacionEvent();

  @override
  List<Object?> get props => [];

}

// Evento para obtener todas las notificaciones
class ObtenerNotificaciones extends NotificacionEvent { }

// Evento para obtener una notificación por id
class ObtenerNotificacionPorId extends NotificacionEvent {

  final int id;

  const ObtenerNotificacionPorId(this.id);

  @override
  List<Object?> get props => [id];

}