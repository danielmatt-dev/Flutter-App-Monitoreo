class ImagenPacienteSearchRequest {
  final String tipoBusqueda;
  final String? regionCuerpo;
  final String? fechaInicio;
  final String? fechaFin;

  ImagenPacienteSearchRequest({
    required this.tipoBusqueda,
    this.regionCuerpo,
    this.fechaInicio,
    this.fechaFin,
  });
}
