import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion.dart';
import 'package:app_plataforma/src/features/notificacion/domain/repositories/notificacion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class BuscarNotificacion extends UseCase<Notificacion, NoParams> {

  final NotificacionRepository repository;

  BuscarNotificacion(this.repository);

  @override
  Future<Either<Exception, Notificacion>> call(NoParams params) =>
      repository.buscarNotificacion();

}