import 'package:json_annotation/json_annotation.dart';

// <>
part 'direccion_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DireccionModel {

  final int id;
  final String colonia;
  @JsonKey(name: 'codigo_postal')
  final String codigoPostal;
  final String asentamiento;
  final String calle;
  final String numero;
  final String entreCalleUno;
  final String entreCalleDos;
  final String ciudad;
  final String estado;
  final String pais;

  DireccionModel({
    required this.id,
    required this.colonia,
    required this.codigoPostal,
    required this.asentamiento,
    required this.calle,
    required this.numero,
    required this.entreCalleUno,
    required this.entreCalleDos,
    required this.ciudad,
    required this.estado,
    required this.pais
  });

  factory DireccionModel.fromJson(Map<String, dynamic> json) => _$DireccionModelFromJson(json);

  Map<String, dynamic> toJson() => _$DireccionModelToJson(this);

}