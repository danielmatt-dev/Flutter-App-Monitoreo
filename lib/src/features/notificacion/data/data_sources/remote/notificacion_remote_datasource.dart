import 'package:dartz/dartz.dart';

import '../../models/notificacion_model.dart';

// <>
abstract class NotificacionRemoteDataSource {

  Future<Either<Exception, NotificacionModel>> buscarNotificacion();

  Future<Either<Exception, List<NotificacionModel>>> buscarNotificaciones();

}