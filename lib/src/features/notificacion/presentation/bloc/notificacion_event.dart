part of 'notificacion_bloc.dart';

abstract class NotificacionEvent extends Equatable {
  const NotificacionEvent();

  @override
  List<Object?> get props => [];

}

// Evento para obtener todas las notificaciones generales
class GetNotifications extends NotificacionEvent {}

// Evento para obtener una notificación
class GetNotification extends NotificacionEvent {}
