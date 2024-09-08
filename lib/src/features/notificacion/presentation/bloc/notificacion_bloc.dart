import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion.dart';
import 'package:app_plataforma/src/features/notificacion/domain/usecases/buscar_notificacion.dart';
import 'package:app_plataforma/src/features/notificacion/domain/usecases/buscar_notificaciones.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notificacion_event.dart';
part 'notificacion_state.dart';

// <>
class NotificacionBloc extends Bloc<NotificacionEvent, NotificacionState> {

  final BuscarNotificaciones buscarNotificaciones;
  final BuscarNotificacion buscarNotificacion;

  NotificacionBloc({
    required this.buscarNotificaciones,
    required this.buscarNotificacion
  }) : super(NotificacionInicial()) {
    on<GetNotification>(_buscandoNotificacionEvent);
    on<GetNotifications>(_buscandoListaNotificacionesEvent);
  }

  Future<void> _buscandoListaNotificacionesEvent(
      GetNotifications event,
      Emitter<NotificacionState> emitter) async {

    emitter(NotificacionLoading());

    final result = await buscarNotificaciones.call(TipoNotificacion.general);
    final resultDos = await buscarNotificaciones.call(TipoNotificacion.personal);

    late final List<Notificacion> generales;
    late final List<Notificacion> personales;

    result.fold(
            (failure) => emitter(NotificacionError(failure.toString())),
            (notifications) => generales = notifications
    );

    resultDos.fold(
            (failure) => emitter(NotificacionError(failure.toString())),
            (notifications) => personales = notifications
    );

    emitter(ListNotificacionesSuccess(generales, personales));
  }

  Future<void> _buscandoNotificacionEvent(
      GetNotification event,
      Emitter<NotificacionState> emitter) async {

    emitter(NotificacionLoading());

    final result = await buscarNotificacion.call(NoParams());

    result.fold(
            (failure) => emitter(NotificacionError(failure.toString())),
            (notificacion) => emitter(NotificacionSuccess(notificacion))
    );

  }

}