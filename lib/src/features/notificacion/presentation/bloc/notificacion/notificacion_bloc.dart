import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion.dart';
import 'package:app_plataforma/src/features/notificacion/domain/usecases/buscar_notificacion_por_id.dart';
import 'package:app_plataforma/src/features/notificacion/domain/usecases/buscar_notificaciones.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notificacion_event.dart';
part 'notificacion_state.dart';
part 'notificacion_bloc.freezed.dart';

// <>
class NotificacionBloc extends Bloc<NotificacionEvent, NotificacionState> {

  final BuscarNotificaciones buscarNotificaciones;
  final BuscarNotificacionPorId buscarNotificacionPorId;

  NotificacionBloc({
    required this.buscarNotificaciones,
    required this.buscarNotificacionPorId
  }) : super(const NotificacionState.initial()) {
    on<ObtenerNotificaciones>(_buscandoListaNotificacionesEvent);
    on<ObtenerNotificacionPorId>(_buscandoNotificacionPorIdEvent);
  }

  _buscandoListaNotificacionesEvent(
      ObtenerNotificaciones event,
      Emitter<NotificacionState> emitter) async {

    emitter(const NotificacionState.loading());

    final result = await buscarNotificaciones.call(NoParams());

    result.fold(
            (failure) => emitter(NotificacionState.error(failure.toString())),
            (notificaciones) => emitter(NotificacionState.listSuccess(notificaciones))
    );

  }

  _buscandoNotificacionPorIdEvent(
      ObtenerNotificacionPorId event,
      Emitter<NotificacionState> emitter) async {

    emitter(const NotificacionState.loading());

    final result = await buscarNotificacionPorId.call(1);

    result.fold(
            (failure) => emitter(NotificacionState.error(failure.toString())),
            (notificacion) => emitter(NotificacionState.success(notificacion))
    );

  }

}