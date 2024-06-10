import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion.dart';
import 'package:app_plataforma/src/features/notificacion/domain/repositories/notificacion_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class BuscarNotificaciones extends UseCase<List<Notificacion>, NoParams> {

  final NotificacionRepository repository;

  BuscarNotificaciones(this.repository);

  @override
  Future<Either<Exception, List<Notificacion>>> call(NoParams params) async =>
      await repository.buscarNotificaciones();

}