part of 'registro_respuestas_cubit.dart';

@immutable
sealed class RegistroRespuestasState {
  const RegistroRespuestasState();
}

// Estado inicial
class RegistroRespuestasInicial extends RegistroRespuestasState {}

// Estado de carga
class RegistroRespuestasLoading extends RegistroRespuestasState {}

// Registro creado
class RegistroRespuestasCreateSuccess extends RegistroRespuestasState {

  final RegistroRespuestas respuesta;

  const RegistroRespuestasCreateSuccess({required this.respuesta});

}

// Registro añadido a la lista
class RegistroRespuestasAddSuccess extends RegistroRespuestasState {}

// Registro de respuesta creado
class RegistroRespuestasListSuccess extends RegistroRespuestasState {

  final List<RegistroRespuestas> respuestas;

  const RegistroRespuestasListSuccess({required this.respuestas});

}

// Registro de respuestas guardado
class RegistroRespuestasSaveSuccess extends RegistroRespuestasState {

  final bool success;

  const RegistroRespuestasSaveSuccess({required this.success});

}

// Error al cargar las respuestas
class RegistroRespuestasError extends RegistroRespuestasState {

  final String error;

  const RegistroRespuestasError({required this.error});

}