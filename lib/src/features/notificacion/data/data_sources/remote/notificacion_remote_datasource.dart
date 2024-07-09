import 'package:app_plataforma/src/features/notificacion/data/models/notificacion_model.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class NotificacionRemoteDataSource {

  Future<Either<Exception, NotificacionModel>> buscarNotificacion(int folio);

  Future<Either<Exception, List<NotificacionModel>>> buscarNotificaciones();

  Future<Either<Exception, List<NotificacionModel>>> buscarNotificacionesPersonales(int folio);

}