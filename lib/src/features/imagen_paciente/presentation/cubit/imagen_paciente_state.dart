import 'package:app_plataforma/src/features/imagen_paciente/domain/entities/imagen_paciente_response.dart';
import 'package:flutter/cupertino.dart';

@immutable
sealed class ImagenPacienteState {

  const ImagenPacienteState();

}

class ImagenPacienteLoading extends ImagenPacienteState {}

class SaveImagenPacienteSuccess extends ImagenPacienteState {}

class ListImagenPacienteSuccess extends ImagenPacienteState {

  final List<ImagenPacienteResponse> images;

  const ListImagenPacienteSuccess({required this.images});

}

class EmptyListImagenPaciente extends ImagenPacienteState {}

class ImagenPacienteError extends ImagenPacienteState {}