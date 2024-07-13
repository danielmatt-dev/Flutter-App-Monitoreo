part of 'registro_respuestas_cubit.dart';

@immutable
sealed class RegistroRespuestasState {
  const RegistroRespuestasState();
}

// Estado inicial
class RegistroRespuestasInicial extends RegistroRespuestasState {}

// Estado de carga
class RegistroRespuestasLoading extends RegistroRespuestasState {}

// Registro de respuestas guardado
class RegistroRespuestasSaveSuccess extends RegistroRespuestasState {}

// Error al cargar las respuestas
class RegistroRespuestasError extends RegistroRespuestasState {

  final String error;

  const RegistroRespuestasError({required this.error});

}