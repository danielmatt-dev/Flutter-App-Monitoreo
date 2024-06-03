import 'package:app_plataforma/src/features/notificacion/data/models/notificacion_model.dart';
import 'package:smartstruct/smartstruct.dart';
import '../../../domain/entities/notificacion.dart';

part 'notificacion_mapper.mapper.g.dart';

@Mapper()
abstract class NotificacionMapper {

  NotificacionModel toNotificacionModel(Notificacion notificacion);

  Notificacion toNotificacion(NotificacionModel model);

  //List<NotificacionModel> toNotificacionModelList(List<Notificacion> model);

  //List<Notificacion> toNotificacionList(List<NotificacionModel> notificacion);

}
