import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion_personal.dart';
import 'package:app_plataforma/src/features/notificacion/domain/usecases/buscar_notificaciones_personales.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notificacion_personal_event.dart';
part 'notificacion_personal_state.dart';
part 'notificacion_personal_bloc.freezed.dart';

class NotificacionPersonalBloc extends Bloc<NotificacionPersonalEvent, NotificacionPersonalState> {

  final BuscarNotificacionesPersonales buscarNotificacionesPersonales;

  NotificacionPersonalBloc({
    required this.buscarNotificacionesPersonales
  }): super(const NotificacionPersonalState.initial()) {
    on<NotificacionPersonalEvent>(_buscandoNotificacionesEvent);
  }

  Future<void> _buscandoNotificacionesEvent(
      NotificacionPersonalEvent event, 
      Emitter<NotificacionPersonalState> emitter
      ) async {
    
    emitter(const NotificacionPersonalState.loading());
    
    final result = await buscarNotificacionesPersonales.call(NoParams());
    
    result.fold(
            (failure) => emitter(NotificacionPersonalState.error(failure.toString())),
            (notificaciones) => emitter(NotificacionPersonalState.sucess(notificaciones))
    );
    
  }


}