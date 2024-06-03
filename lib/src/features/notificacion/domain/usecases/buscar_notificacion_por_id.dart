import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion.dart';
import 'package:app_plataforma/src/features/notificacion/domain/repositories/notificacion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class BuscarNotificacionPorId extends UseCase<Notificacion, int> {

  final NotificacionRepository repository;

  BuscarNotificacionPorId(this.repository);

  @override
  Future<Either<Exception, Notificacion>> call(int params) =>
      repository.buscarNotificacion();

}