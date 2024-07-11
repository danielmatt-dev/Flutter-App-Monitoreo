import 'package:app_plataforma/src/features/valor/data/models/valor_response_model.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_response.dart';

abstract class ValorResponseMapper{

  ValorResponse toValorResponse(ValorResponseModel model);

}
