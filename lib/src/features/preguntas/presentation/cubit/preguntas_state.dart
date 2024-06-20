part of 'preguntas_cubit.dart';

@freezed
sealed class PreguntaState with _$PreguntaState {

  const factory PreguntaState.initial() = _Initial;
  const factory PreguntaState.loading() = _Loading;
  const factory PreguntaState.listSuccess(List<Pregunta> preguntas) = _Success;
  const factory PreguntaState.error(String message) = _Error;

}

// <>

