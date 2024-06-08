// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_glucosa_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class ValorGlucosaMapperImpl extends ValorGlucosaMapper {
  ValorGlucosaMapperImpl() : super();

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
}
