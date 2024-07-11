import 'package:app_plataforma/src/features/valor/data/models/valor_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'valor_presion_response_model.g.dart';

// <>
@JsonSerializable(fieldRename: FieldRename.snake)
class ValorPresionResponseModel extends ValorResponseModel {

  final int valorSistolica;
  final int valorDiastolica;

  ValorPresionResponseModel({
    required super.folio,
    required super.fecha,
    required super.hora,
    required this.valorSistolica,
    required this.valorDiastolica,
    required super.color,
    required super.medicion,
    required super.notas
  });

  factory ValorPresionResponseModel.fromJson(Map<String, dynamic> json) => _$ValorPresionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ValorPresionResponseModelToJson(this);

}