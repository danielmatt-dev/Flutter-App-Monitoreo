import 'package:app_plataforma/src/features/notificacion/data/models/notificacion_model.dart';
import 'package:app_plataforma/src/features/notificacion/data/models/notificacion_personal_model.dart';
import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion.dart';
import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion_personal.dart';
import 'package:smartstruct/smartstruct.dart';

part 'notificacion_mapper.mapper.g.dart';

@Mapper()
abstract class NotificacionMapper {

  Notificacion toNotificacion(NotificacionModel model);

  NotificacionPersonal toNotificacionPersonal(NotificacionPersonalModel model);

}
