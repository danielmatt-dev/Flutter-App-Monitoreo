// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracion_mediciones_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class ConfiguracionMedicionesMapperImpl extends ConfiguracionMedicionesMapper {
  ConfiguracionMedicionesMapperImpl() : super();

  @override
  ConfiguracionMediciones toConfiguracionMediciones(
      ConfiguracionMedicionesModel model) {
    final configuracionmediciones = ConfiguracionMediciones(
      idPaciente: model.idPaciente,
      medicionPresionTemprano: model.medicionPresionTemprano,
      medicionPresionTarde: model.medicionPresionTarde,
      medicionPresionNoche: model.medicionPresionNoche,
      medicionGlucosaAntesDesayuno: model.medicionGlucosaAntesDesayuno,
      medicionGlucosaAntesComida: model.medicionGlucosaAntesComida,
      medicionGlucosaDosHorasDespues: model.medicionGlucosaDosHorasDespues,
      medicionGlucosaAntesCena: model.medicionGlucosaAntesCena,
    );
    return configuracionmediciones;
  }
}
