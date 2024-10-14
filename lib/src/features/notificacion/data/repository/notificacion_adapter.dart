import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/notificacion/data/data_sources/remote/notificacion_remote_datasource.dart';
import 'package:app_plataforma/src/features/notificacion/data/models/mapper/notificacion_mapper.dart';
import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion.dart';
import 'package:app_plataforma/src/features/notificacion/domain/repositories/notificacion_repository.dart';
import 'package:dartz/dartz.dart';

// <>
class NotificacionAdapter extends NotificacionRepository {

  final NotificacionRemoteDataSource remote;
  final NotificacionMapper mapper;
  final AuthRepository local;

  NotificacionAdapter({
    required this.remote,
    required this.mapper,
    required this.local
  });

  @override
  Future<Either<Exception, Notificacion>> buscarNotificacion() async {

    local.setToken('eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ5YW1pbGUxOEBnbWFpbC5jb20iLCJpYXQiOjE3Mjg4NzE4NzUsImV4cCI6MTcyOTEzMTA3NX0.QGyiNGKoDxFCJnIMYL6EFtczDoHm9v-TEVbl4KX_Fa8');

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

              final response = await remote.buscarNotificacion(folio, local.getToken());

              return response.fold(
                      (failure) => Left(failure),
                      (model) => Right(mapper.toNotificacion(model))
              );
            }
    );
  }

  @override
  Future<Either<Exception, List<Notificacion>>> buscarNotificaciones(TipoNotificacion tipo) async {

    return local.getFolio().fold(
            (failure) => Left(failure),
            (folio) async {

              final response = await remote.buscarNotificaciones(folio, local.getToken(), tipo);

              return response.fold(
                      (failure) => Left(failure),
                      (models) => Right(models.map((model) => mapper.toNotificacion(model)).toList())
              );
            }
    );

  }

}