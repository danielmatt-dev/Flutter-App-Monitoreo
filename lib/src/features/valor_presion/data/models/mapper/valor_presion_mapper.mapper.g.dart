// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_presion_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class ValorPresionMapperImpl extends ValorPresionMapper {
  ValorPresionMapperImpl() : super();

  @override
  ValorPresionResponse toValorPresionResponse(ValorPresionResponseModel model) {
    final valorpresionresponse = ValorPresionResponse(
      folio: model.folio,
      fecha: model.fecha,
      hora: model.hora,
      valorSistolica: model.valorSistolica,
      valorDiastolica: model.valorDiastolica,
      nivel: model.nivel,
      medicion: model.medicion,
      notas: model.notas,
    );
    return valorpresionresponse;
  }

  @override
  ValorPresionRequestModel toValorPresionRequestModel(
      ValorPresionRequest request) {
    final valorpresionrequestmodel = ValorPresionRequestModel(
      idPaciente: request.idPaciente,
      valorSistolica: request.valorSistolica,
      valorDiastolica: request.valorDiastolica,
      medicion: request.medicion,
      notas: request.notas,
    );
    return valorpresionrequestmodel;
  }
}
