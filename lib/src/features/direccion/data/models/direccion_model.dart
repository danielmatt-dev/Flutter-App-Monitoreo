import 'package:json_annotation/json_annotation.dart';
// <>

part 'direccion_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DireccionModel {

  final int folio;
  final String colonia;
  @JsonKey(name: 'codigo_postal')
  final String codigoPostal;
  final String ciudad;
  final String estado;
  final String pais;

  DireccionModel({
    required this.folio,
    required this.colonia,
    required this.codigoPostal,
    required this.ciudad,
    required this.estado,
    required this.pais
  });

  factory DireccionModel.fromJson(Map<String, dynamic> json) => _$DireccionModelFromJson(json);

  Map<String, dynamic> toJson() => _$DireccionModelToJson(this);

}