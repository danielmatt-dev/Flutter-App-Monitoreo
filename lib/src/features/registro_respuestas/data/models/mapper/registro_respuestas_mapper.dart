import 'package:app_plataforma/src/features/registro_respuestas/data/models/registro_respuestas_model.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:smartstruct/smartstruct.dart';

part 'registro_respuestas_mapper.mapper.g.dart';

@Mapper()
abstract class RegistroRespuestasMapper {

  RegistroRespuestasModel toRegistroRespuestasModel(RegistroRespuestas respuestas);

}