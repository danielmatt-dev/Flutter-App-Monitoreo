import 'package:app_plataforma/src/features/valor_glucosa/data/models/valor_glucosa_response_model.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_response.dart';
import 'package:smartstruct/smartstruct.dart';

part 'valor_glucosa_mapper.mapper.g.dart';

@Mapper()
abstract class ValorGlucosaMapper {

  ValorGlucosaResponse toValorGlucosaResponse(ValorGlucosaResponseModel model);

}