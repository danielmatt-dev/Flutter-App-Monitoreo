import 'package:json_annotation/json_annotation.dart';

part 'valor_presion_response_model.g.dart';

// <>
@JsonSerializable(fieldRename: FieldRename.snake)
class ValorPresionResponseModel {

  final int folio;
  final String fecha;
  final String hora;
  final int valorSistolica;
  final int valorDiastolica;
  final String color;
  final String medicion;
  final String notas;

  ValorPresionResponseModel({
    required this.folio,
    required this.fecha,
    required this.hora,
    required this.valorSistolica,
    required this.valorDiastolica,
    required this.color,
    required this.medicion,
    required this.notas
  });

  factory ValorPresionResponseModel.fromJson(Map<String, dynamic> json) => _$ValorPresionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValorPresionResponseModelToJson(this);

}