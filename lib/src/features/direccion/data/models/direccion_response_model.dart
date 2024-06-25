import 'package:json_annotation/json_annotation.dart';

part 'direccion_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DireccionResponseModel {

  @JsonKey(name: 'codigo_postal')
  final String codigoPostal;
  final List<String> colonias;
  final String ciudad;
  final String estado;
  final String pais;

  DireccionResponseModel({
    required this.colonias,
    required this.codigoPostal,
    required this.ciudad,
    required this.estado,
    required this.pais
  });


  factory DireccionResponseModel.fromJson(Map<String, dynamic> json) => _$DireccionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DireccionResponseModelToJson(this);


}