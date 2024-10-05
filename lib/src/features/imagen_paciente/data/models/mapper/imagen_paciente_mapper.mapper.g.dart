// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagen_paciente_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class ImagenPacienteMapperImpl extends ImagenPacienteMapper {
  ImagenPacienteMapperImpl() : super();

  @override
  ImagenPacienteRequestModel toImagenPacienteRequestModel(
      ImagenPacienteRequest request) {
    final imagenpacienterequestmodel = ImagenPacienteRequestModel(
      tipoImagen: request.tipoImagen,
      imagen: request.imagen,
      fecha: request.fecha,
      hora: request.hora,
    );
    return imagenpacienterequestmodel;
  }

  @override
  ImagenPacienteResponseModel toImagenPacienteResponseModel(
      ImagenPacienteResponse response) {
    final imagenpacienteresponsemodel = ImagenPacienteResponseModel(
      url: response.url,
      tipoImagen: response.tipoImagen,
      fecha: response.fecha,
      hora: response.hora,
    );
    return imagenpacienteresponsemodel;
  }

  @override
  ImagenPacienteSearchRequestModel toImagenPacienteSearchResponseModel(
      ImagenPacienteSearchRequest response) {
    final imagenpacientesearchrequestmodel = ImagenPacienteSearchRequestModel(
      tipoBusqueda: response.tipoBusqueda,
      regionCuerpo: response.regionCuerpo,
      fechaInicio: response.fechaInicio,
      fechaFin: response.fechaFin,
    );
    return imagenpacientesearchrequestmodel;
  }
}
