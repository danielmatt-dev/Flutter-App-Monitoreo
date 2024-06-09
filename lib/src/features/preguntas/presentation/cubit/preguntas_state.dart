part of 'preguntas_cubit.dart';

@immutable
sealed class PreguntaState { const PreguntaState(); }

// Estado inicial
class PreguntaInicial extends PreguntaState {}

// Cargando preguntas
class PreguntaLoading extends PreguntaState {}

// Preguntas cargadas
class PreguntaListSuccess extends PreguntaState {

  final List<Pregunta> preguntas;

  const PreguntaListSuccess({required this.preguntas});

}

// Error al cargar preguntas
class PreguntaError extends PreguntaState {

  final String error;

  const PreguntaError({required this.error});

}

// <>

