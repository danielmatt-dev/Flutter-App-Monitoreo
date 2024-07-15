import 'package:json_annotation/json_annotation.dart';

part 'medicion_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MedicionModel {

  final int folio;
  final String medicion;
  final DateTime fecha;
  final String tipo;

  MedicionModel({
    required this.folio,
    required this.medicion,
    required this.fecha,
    required this.tipo,
  });

  factory MedicionModel.fromJson(Map<String, dynamic> json) => _$MedicionModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicionModelToJson(this);

}

// <>