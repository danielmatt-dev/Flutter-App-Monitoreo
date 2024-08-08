import 'package:app_plataforma/src/features/tratamiento/data/models/tratamiento_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tratamiento_paciente_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TratamientoPacienteModel {

  late int folio;
  final List<TratamientoModel> tratamientos;

  TratamientoPacienteModel({
    required this.tratamientos
  });

  factory TratamientoPacienteModel.fromJson(Map<String, dynamic> json) => _$TratamientoPacienteModelFromJson(json);

  Map<String, dynamic> toJson() => _$TratamientoPacienteModelToJson(this);

}