import 'package:app_plataforma/src/features/notificacion/data/models/notificacion_model.dart';
import 'package:app_plataforma/src/features/notificacion/domain/entities/notificacion.dart';
import 'package:smartstruct/smartstruct.dart';

part 'notificacion_mapper.mapper.g.dart';

@Mapper()
abstract class NotificacionMapper {

  NotificacionModel toNotificacionModel(Notificacion notificacion);

  Notificacion toNotificacion(NotificacionModel model);

  //List<NotificacionModel> toNotificacionModelList(List<Notificacion> entities);

  //List<Notificacion> toNotificacionList(List<NotificacionModel> notificacion);

}
