import 'package:json_annotation/json_annotation.dart';

part 'valor_average_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ValorAverageModel {

  final String titulo;
  final double promedio;
  final String color;
  final double valorMinimo;
  final double valorMaximo;

  const ValorAverageModel({
    required this.titulo,
    required this.promedio,
    required this.color,
    required this.valorMinimo,
    required this.valorMaximo
  });

  factory ValorAverageModel.fromJson(Map<String, dynamic> json) => _$ValorAverageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValorAverageModelToJson(this);

}

// <>