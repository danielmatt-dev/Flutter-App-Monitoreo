part of 'notificacion_bloc.dart';

@freezed
class NotificacionState with _$NotificacionState {

  const factory NotificacionState.initial() = _Initial;
  const factory NotificacionState.loading() = _Loading;
  const factory NotificacionState.listSuccess(List<Notificacion> notificaciones) = _ListSuccess;
  const factory NotificacionState.success(Notificacion notificacion) = _Success;
  const factory NotificacionState.error(String message) = _Error;

}
