import 'package:app_plataforma/src/features/valor/data/models/valor_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'valor_glucosa_response_model.g.dart';

// <>
@JsonSerializable(fieldRename: FieldRename.snake)
class ValorGlucosaResponseModel extends ValorResponseModel {

  final int valor;

  ValorGlucosaResponseModel({
    required super.folio,
    required super.fecha,
    required super.hora,
    required this.valor,
    required super.color,
    required super.medicion,
    required super.notas
  });

  factory ValorGlucosaResponseModel.fromJson(Map<String, dynamic> json) => _$ValorGlucosaResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValorGlucosaResponseModelToJson(this);

}