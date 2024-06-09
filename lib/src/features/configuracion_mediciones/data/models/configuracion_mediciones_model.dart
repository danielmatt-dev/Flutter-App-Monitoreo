import 'package:json_annotation/json_annotation.dart';

class ConfiguracionMedicionesModel {

  final String idPaciente;
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

  factory ConfiguracionMedicionesModel.fromJson(Map<String, dynamic> map) {
    return ConfiguracionMedicionesModel(
      idPaciente: map['id_paciente'],
      medicionPresionTemprano: map['medicion_presion_mañana'],
      medicionPresionTarde: map['medicion_presion_tarde'],
      medicionPresionNoche: map['medicion_presion_noche'],
      medicionGlucosaAntesDesayuno: map['medicion_glucosa_antes_desayuno'] == 1,
      medicionGlucosaAntesComida: map['medicion_glucosa_antes_comida'] == 1,
      medicionGlucosaDosHorasDespues: map['medicion_glucosa_dos_horas_despues'] == 1,
      medicionGlucosaAntesCena: map['medicion_glucosa_antes_cena'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_paciente': idPaciente,
      'medicion_presion_temprano': medicionPresionTemprano,
      'medicion_presion_tarde': medicionPresionTarde,
      'medicion_presion_noche': medicionPresionNoche,
      'medicion_glucosa_antes_desayuno': medicionGlucosaAntesDesayuno ? 1 : 0,
      'medicion_glucosa_antes_comida': medicionGlucosaAntesComida ? 1 : 0,
      'medicion_glucosa_dos_horas_despues': medicionGlucosaDosHorasDespues ? 1 : 0,
      'medicion_glucosa_antes_cena': medicionGlucosaAntesCena ? 1 : 0,
    };
  }

}

// <>