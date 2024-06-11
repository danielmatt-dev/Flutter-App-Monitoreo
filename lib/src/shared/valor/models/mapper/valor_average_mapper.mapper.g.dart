// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valor_average_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class ValorAverageMapperImpl extends ValorAverageMapper {
  ValorAverageMapperImpl() : super();

  @override
  ValorAverage toValorAverage(ValorAverageModel model) {
    final valoraverage = ValorAverage(
      promedio: model.promedio,
      color: model.color,
      valorMinimo: model.valorMinimo,
      valorMaximo: model.valorMaximo,
    );
    return valoraverage;
  }
}
