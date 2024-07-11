import 'package:json_annotation/json_annotation.dart';

part 'promedio_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PromedioModel {

  final String medicion;
  final int promedio;
  final String medida;
  final String color;
  final int valorMinimo;
  final int valorMaximo;

  const PromedioModel({
    required this.medicion,
    required this.promedio,
    required this.medida,
    required this.color,
    required this.valorMinimo,
    required this.valorMaximo
  });

  factory PromedioModel.fromJson(Map<String, dynamic> json) => _$PromedioModelFromJson(json);

  Map<String, dynamic> toJson() => _$PromedioModelToJson(this);

}

// <>