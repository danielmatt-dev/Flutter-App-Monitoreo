import 'package:json_annotation/json_annotation.dart';

part 'valor_glucosa_response_model.g.dart';

// <>
@JsonSerializable(fieldRename: FieldRename.snake)
class ValorGlucosaResponseModel {

  @JsonKey(name: 'folio')
  final int folio;
  final String fecha;
  final String hora;
  final int valor;
  final String nivel;
  final String medicion;
  final String notas;

  ValorGlucosaResponseModel({
    required this.folio,
    required this.fecha,
    required this.hora,
    required this.valor,
    required this.nivel,
    required this.medicion,
    required this.notas
  });

  factory ValorGlucosaResponseModel.fromJson(Map<String, dynamic> json) => _$ValorGlucosaResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValorGlucosaResponseModelToJson(this);

}