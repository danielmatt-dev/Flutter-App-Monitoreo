// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_glucosa_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class ValorGlucosaMapperImpl extends ValorGlucosaMapper {

  ValorGlucosaMapperImpl() : super();

  @override
  ValorGlucosaRequest toValorGlucosaRequest(ValorGlucosaRequestModel model) {
    final valorglucosarequest = ValorGlucosaRequest(
      idPaciente: model.idPaciente,
      valor: model.valor,
      medicion: model.medicion,
      notas: model.notas,
    );
    return valorglucosarequest;
  }

  @override
  ValorGlucosaRequestModel toValorGlucosaRequestModel(
      ValorGlucosaRequest request) {
    final valorglucosarequestmodel = ValorGlucosaRequestModel(
      idPaciente: request.idPaciente,
      valor: request.valor,
      medicion: request.medicion,
      notas: request.notas,
    );
    return valorglucosarequestmodel;
  }

  @override
  ValorGlucosaResponse toValorGlucosaResponse(ValorGlucosaResponseModel model) {
    final valorglucosaresponse = ValorGlucosaResponse(
      folio: model.folio,
      fecha: model.fecha,
      hora: model.hora,
      valor: model.valor,
      nivel: model.nivel,
      medicion: model.medicion,
      notas: model.notas,
    );
    return valorglucosaresponse;
  }

  @override
  ValorGlucosaResponseModel toValorGlucosaResponseModel(
      ValorGlucosaResponse response) {
    final valorglucosaresponsemodel = ValorGlucosaResponseModel(
      folio: response.folio,
      fecha: response.fecha,
      hora: response.hora,
      valor: response.valor,
      nivel: response.nivel,
      medicion: response.medicion,
      notas: response.notas,
    );
    return valorglucosaresponsemodel;
  }
}
