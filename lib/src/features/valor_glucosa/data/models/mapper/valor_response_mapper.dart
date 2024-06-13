import 'package:app_plataforma/src/features/valor_glucosa/data/models/valor_glucosa_response_model.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_response.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/valor_presion_response_model.dart';

abstract class ValorResponseMapper{

  ValorResponse toValorResponseGlucosa(ValorGlucosaResponseModel model);

  ValorResponse toValorResponsePresion(ValorPresionResponseModel model);

}
