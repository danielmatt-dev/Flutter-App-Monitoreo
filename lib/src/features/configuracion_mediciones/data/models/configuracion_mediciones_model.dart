import 'package:json_annotation/json_annotation.dart';

part 'configuracion_mediciones_model.g.dart';

@JsonSerializable()
class ConfiguracionMedicionesModel {

  final String idPaciente;
  @JsonKey(name: 'medicionMañana')
  final String medicionPresionTemprano;
  final String medicionPresionTarde;
  final String medicionPresionNoche;
  final bool medicionGlucosaAntesDesayuno;
  final bool medicionGlucosaAntesComida;
  final bool medicionGlucosaDosHorasDespues;
  final bool medicionGlucosaAntesCena;

  ConfiguracionMedicionesModel({
    required this.idPaciente,
    required this.medicionPresionTemprano,
    required this.medicionPresionTarde,
    required this.medicionPresionNoche,
    required this.medicionGlucosaAntesDesayuno,
    required this.medicionGlucosaAntesComida,
    required this.medicionGlucosaDosHorasDespues,
    required this.medicionGlucosaAntesCena
  });

  factory ConfiguracionMedicionesModel.fromJson(Map<String, dynamic> json) => _$ConfiguracionMedicionesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfiguracionMedicionesModelToJson(this);

}

// <>