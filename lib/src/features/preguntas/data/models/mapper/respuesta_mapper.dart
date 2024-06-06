import 'package:app_plataforma/src/features/preguntas/data/models/respuesta_model.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/respuesta.dart';
import 'package:smartstruct/smartstruct.dart';

part 'respuesta_mapper.mapper.g.dart';

@Mapper()
abstract class RespuestaMapper {

  Respuesta toRespuesta(RespuestaModel model);

}
// <>