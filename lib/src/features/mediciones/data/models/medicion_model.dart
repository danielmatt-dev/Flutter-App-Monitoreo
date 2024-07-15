import 'package:json_annotation/json_annotation.dart';

part 'medicion_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MedicionModel {

  final int folio;
  final String medicion;
  final DateTime fecha;
  final String tipoMedicion;

  MedicionModel({
    required this.folio,
    required this.medicion,
    required this.fecha,
    required this.tipoMedicion,
  });

  factory MedicionModel.fromJson(Map<String, dynamic> json) => _$MedicionModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicionModelToJson(this);

}

// <>