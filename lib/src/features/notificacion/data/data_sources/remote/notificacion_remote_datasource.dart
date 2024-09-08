import 'package:app_plataforma/src/features/notificacion/data/models/notificacion_model.dart';
import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class NotificacionRemoteDataSource {

  Future<Either<Exception, NotificacionModel>> buscarNotificacion(int folio, String token);

  Future<Either<Exception, List<NotificacionModel>>> buscarNotificaciones(int folio, String token, TipoNotificacion tipo);

}