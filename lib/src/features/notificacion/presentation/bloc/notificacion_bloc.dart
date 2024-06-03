import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/notificacion.dart';
import '../../domain/usecases/buscar_notificacion_por_id.dart';
import '../../domain/usecases/buscar_notificaciones.dart';
part 'notificacion_event.dart';
part 'notificacion_state.dart';

// <>
class NotificacionBloc extends Bloc<NotificacionEvent, NotificacionState> {

  final BuscarNotificaciones buscarNotificaciones;
  final BuscarNotificacionPorId buscarNotificacionPorId;

  NotificacionBloc({
    required this.buscarNotificaciones,
    required this.buscarNotificacionPorId
  })
      : super(NotificacionInicial()) {
    on<ObtenerNotificaciones>(_buscandoListaNotificacionesEvent);
    on<ObtenerNotificacionPorId>(_buscandoNotificacionPorIdEvent);
  }

  _buscandoListaNotificacionesEvent(
      ObtenerNotificaciones event,
      Emitter<NotificacionState> emitter) async {

    emitter(NotificacionLoading());

    final result = await buscarNotificaciones.call(NoParams());

    result.fold(
            (failure) => emitter(NotificacionError(failure.toString())),
            (notificaciones) => emitter(ListaNotificacionesSuccess(notificaciones))
    );

  }

  _buscandoNotificacionPorIdEvent(
      ObtenerNotificacionPorId event,
      Emitter<NotificacionState> emitter) async {

    emitter(NotificacionLoading());

    final result = await buscarNotificacionPorId.call(1);

    result.fold(
            (failure) => emitter(NotificacionError(failure.toString())),
            (notificacion) => emitter(NotificacionSuccess(notificacion))
    );

  }

}