import 'package:freezed_annotation/freezed_annotation.dart';

part 'tratamiento_model.g.dart';

@JsonSerializable()
class TratamientoModel {

  final int idTratamiento;
  final String nombre;
  final String tipo;

  const TratamientoModel({
    required this.idTratamiento,
    required this.nombre,
    required this.tipo
  });

  factory TratamientoModel.fromJson(Map<String, dynamic> json) => _$TratamientoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TratamientoModelToJson(this);

}