// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promedio_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class PromedioMapperImpl extends PromedioMapper {
  PromedioMapperImpl() : super();

  @override
  Promedio toPromedio(PromedioModel model) {
    final promedio = Promedio(
      medicion: model.medicion,
      promedio: model.promedio,
      color: model.color,
      valorMinimo: model.valorMinimo,
      valorMaximo: model.valorMaximo,
    );
    return promedio;
  }
}
