import 'package:app_plataforma/src/features/mediciones/data/models/medicion_model.dart';
import 'package:app_plataforma/src/features/mediciones/domain/entities/medicion.dart';
import 'package:smartstruct/smartstruct.dart';

part 'medicion_mapper.mapper.g.dart';

@Mapper()
abstract class MedicionMapper {

  Medicion toMedicion(MedicionModel model);

}