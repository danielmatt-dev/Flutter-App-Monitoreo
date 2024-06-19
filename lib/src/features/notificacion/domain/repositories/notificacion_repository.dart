import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion.dart';
import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion_personal.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class NotificacionRepository {

  Future<Either<Exception, Notificacion>> buscarNotificacion();

  Future<Either<Exception, List<Notificacion>>> buscarNotificaciones();

  Future<Either<Exception, List<NotificacionPersonal>>> buscarNotificacionesPersonales();

}