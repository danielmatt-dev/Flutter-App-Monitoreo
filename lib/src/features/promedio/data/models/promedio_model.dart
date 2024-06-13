import 'package:json_annotation/json_annotation.dart';

part 'promedio_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PromedioModel {

  final double promedio;
  final String color;
  final double valorMinimo;
  final double valorMaximo;

  const PromedioModel({
    required this.promedio,
    required this.color,
    required this.valorMinimo,
    required this.valorMaximo
  });

  factory PromedioModel.fromJson(Map<String, dynamic> json) => _$PromedioModelFromJson(json);

  Map<String, dynamic> toJson() => _$PromedioModelToJson(this);

}

// <>