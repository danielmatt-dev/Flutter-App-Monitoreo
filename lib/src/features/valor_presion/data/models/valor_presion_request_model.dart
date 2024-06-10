import 'package:json_annotation/json_annotation.dart';

part 'valor_presion_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ValorPresionRequestModel {

  final int folio;
  final int valorSistolica;
  final int valorDiastolica;
  final String medicion;
  final String notas;

  ValorPresionRequestModel({
    required this.folio,
    required this.valorSistolica,
    required this.valorDiastolica,
    required this.medicion,
    required this.notas
  });

  factory ValorPresionRequestModel.fromJson(Map<String, dynamic> json) => _$ValorPresionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValorPresionRequestModelToJson(this);

}

// <>