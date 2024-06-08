import 'package:app_plataforma/src/features/valor_presion/data/models/valor_presion_request_model.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/valor_presion_response_model.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_response.dart';
import 'package:smartstruct/smartstruct.dart';

part 'valor_presion_mapper.mapper.g.dart';

@Mapper()
abstract class ValorPresionMapper {

  ValorPresionResponse toValorPresionResponse(ValorPresionResponseModel model);

  ValorPresionRequestModel toValorPresionRequestModel(ValorPresionRequest request);

}