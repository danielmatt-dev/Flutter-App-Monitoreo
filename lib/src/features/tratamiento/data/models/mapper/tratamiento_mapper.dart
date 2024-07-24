import 'package:app_plataforma/src/features/tratamiento/data/models/tratamiento_model.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:smartstruct/smartstruct.dart';

part 'tratamiento_mapper.mapper.g.dart';

@Mapper()
abstract class TratamientoMapper {

  Tratamiento toTratamiento(TratamientoModel model);

}
