part of 'notificacion_personal_bloc.dart';

// <>
@freezed
class NotificacionPersonalState with _$NotificacionPersonalState {

  const factory NotificacionPersonalState.initial() = _Initial;
  const factory NotificacionPersonalState.loading() = _Loading;
  const factory NotificacionPersonalState.success(List<Notificacion> notificaciones) = _Success;
  const factory NotificacionPersonalState.error(String message) = _Error;

}
