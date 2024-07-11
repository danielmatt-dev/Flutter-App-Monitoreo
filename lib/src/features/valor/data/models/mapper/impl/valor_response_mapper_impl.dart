import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:app_plataforma/src/features/valor/data/models/impl/glucosa/valor_glucosa_response_model.dart';
import 'package:app_plataforma/src/features/valor/data/models/impl/presion/valor_presion_response_model.dart';
import 'package:app_plataforma/src/features/valor/data/models/mapper/valor_response_mapper.dart';
import 'package:app_plataforma/src/features/valor/data/models/valor_response_model.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_response.dart';
import 'package:intl/intl.dart';


class ValorResponseMapperImpl extends ValorResponseMapper {

  @override
  ValorResponse toValorResponse(ValorResponseModel model) {

    final hora = formatTime(model.hora);
    String valor = '';
    final color = mapColor[model.color];
    final medicion = model.medicion;

    if(ValorResponseModel is ValorGlucosaResponseModel){
      model as ValorGlucosaResponseModel;
      valor = '${model.valor} mg/dL';
    }
    if (ValorResponseModel is ValorPresionResponseModel){
      model as ValorPresionResponseModel;
      valor = '${model.valorSistolica}/${model.valorDiastolica} mmHg';
    }

    return ValorResponse(
        hora: hora,
        valor: valor,
        color: color,
        medicion: medicion
    );
  }

  String formatTime(String time) {
    final DateTime dateTime = DateFormat("HH:mm:ss").parse(time);
    return DateFormat("h:mm a").format(dateTime);
  }

}