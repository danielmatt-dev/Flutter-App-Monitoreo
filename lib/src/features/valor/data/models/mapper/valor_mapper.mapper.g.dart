// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class ValorMapperImpl extends ValorMapper {
  ValorMapperImpl() : super();

  @override
  ValorPresionRequestModel toValorPresionRequestModel(
      ValorPresionRequest entity) {
    final valorpresionrequestmodel = ValorPresionRequestModel(
      valorSistolica: entity.valorSistolica,
      valorDiastolica: entity.valorDiastolica,
      medicion: entity.medicion,
      notas: entity.notas,
    );
    return valorpresionrequestmodel;
  }

  @override
  ValorGlucosaRequestModel toValorGlucosaRequestModel(
      ValorGlucosaRequest entity) {
    final valorglucosarequestmodel = ValorGlucosaRequestModel(
      valor: entity.valor,
      medicion: entity.medicion,
      notas: entity.notas,
    );
    return valorglucosarequestmodel;
  }

  @override
  Promedio toPromedio(PromedioModel model) {
    final promedio = Promedio(
      medicion: model.medicion,
      promedio: model.promedio,
      medida: model.medida,
      color: model.color,
      valorMinimo: model.valorMinimo,
      valorMaximo: model.valorMaximo,
    );
    return promedio;
  }
}
