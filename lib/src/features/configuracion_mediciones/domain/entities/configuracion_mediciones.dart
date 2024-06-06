class ConfiguracionMediciones {

  final String idPaciente;
  final String medicionPresionTemprano;
  final String medicionPresionTarde;
  final String medicionPresionNoche;
  final bool medicionGlucosaAntesDesayuno;
  final bool medicionGlucosaAntesComida;
  final bool medicionGlucosaDosHorasDespues;
  final bool medicionGlucosaAntesCena;

  ConfiguracionMediciones({
    required this.idPaciente,
    required this.medicionPresionTemprano,
    required this.medicionPresionTarde,
    required this.medicionPresionNoche,
    required this.medicionGlucosaAntesDesayuno,
    required this.medicionGlucosaAntesComida,
    required this.medicionGlucosaDosHorasDespues,
    required this.medicionGlucosaAntesCena
  });

}