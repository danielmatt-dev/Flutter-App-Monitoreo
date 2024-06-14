import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/valor_glucosa_response_model.dart';
import 'package:app_plataforma/src/features/valor_response/domain/entities/mapper/valor_response_mapper.dart';
import 'package:app_plataforma/src/features/valor_response/domain/entities/valor_response.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/valor_presion_response_model.dart';

class ValorResponseMapperImpl extends ValorResponseMapper {

  @override
  ValorResponse toValorResponseGlucosa(ValorGlucosaResponseModel model) =>
      ValorResponse(
        hora: model.hora,
        valor: '${model.valor} mg/dL',
        color: mapColor[model.color],
        medicion: model.medicion,
      );

  @override
  ValorResponse toValorResponsePresion(ValorPresionResponseModel model)  =>
      ValorResponse(
        hora: model.hora,
        valor: '${model.valorSistolica}/${model.valorDiastolica} mmHg',
        color: mapColor[model.color],
        medicion: model.medicion,
      );

}