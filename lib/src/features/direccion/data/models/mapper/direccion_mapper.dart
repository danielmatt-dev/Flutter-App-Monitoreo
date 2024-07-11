import 'package:app_plataforma/src/features/direccion/data/models/direccion_model.dart';
import 'package:app_plataforma/src/features/direccion/data/models/direccion_response_model.dart';
import 'package:app_plataforma/src/features/direccion/domain/entities/direccion.dart';
import 'package:app_plataforma/src/features/direccion/domain/entities/direccion_response.dart';
import 'package:smartstruct/smartstruct.dart';

part 'direccion_mapper.mapper.g.dart';

@Mapper()
abstract class DireccionMapper {

  DireccionModel toDireccionModel(Direccion direccion);

  DireccionResponse toDireccionResponse(DireccionResponseModel model);

  ColoniaResponse toColoniaResponse(ColoniaResponseModel model);

}