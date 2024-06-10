import 'package:app_plataforma/src/features/configuracion_mediciones/data/models/configuracion_mediciones_model.dart';
import 'package:app_plataforma/src/features/configuracion_mediciones/domain/entities/configuracion_mediciones.dart';
import 'package:smartstruct/smartstruct.dart';

part 'configuracion_mediciones_mapper.mapper.g.dart';

@Mapper()
abstract class ConfiguracionMedicionesMapper {

  ConfiguracionMediciones toConfiguracionMediciones(ConfiguracionMedicionesModel model);

}