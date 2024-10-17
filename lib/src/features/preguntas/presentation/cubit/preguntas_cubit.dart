import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/domain/entities/respuesta.dart';
import 'package:app_plataforma/src/features/preguntas/domain/usecases/buscar_preguntas.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preguntas_state.dart';
part 'preguntas_cubit.freezed.dart';

class PreguntasCubit extends Cubit<PreguntaState>{

  final BuscarPreguntas buscarPreguntas;

  PreguntasCubit({required this.buscarPreguntas}) : super(const PreguntaState.initial());

  void preguntaLoading(){
    emit(const PreguntaState.loading());
  }

  Future<void> buscarPreguntasTipo(TipoPregunta tipoPregunta) async {

    emit(const PreguntaState.loading());

    final result = await buscarPreguntas.call(tipoPregunta);

    final preguntas = [
      Pregunta(
        idPregunta: 1,
        pregunta: 'Mis comidas están equilibradas y contienen alimentos saludables',
        respuestas: [
          Respuesta(idRespuesta: 1, descripcion: 'Nunca', puntaje: 1),
          Respuesta(idRespuesta: 2, descripcion: 'Rara vez', puntaje: 2),
          Respuesta(idRespuesta: 3, descripcion: 'A veces', puntaje: 3),
          Respuesta(idRespuesta: 4, descripcion: 'Casi siempre', puntaje: 4),
          Respuesta(idRespuesta: 5, descripcion: 'Siempre', puntaje: 5),
        ],
      ),
      Pregunta(
        idPregunta: 2,
        pregunta: '¿Conozco la cantidad de carbohidratos que debo consumir al día, y baso mi alimentación en este valor?',
        respuestas: [
          Respuesta(idRespuesta: 1, descripcion: 'Nunca', puntaje: 1),
          Respuesta(idRespuesta: 2, descripcion: 'Rara vez', puntaje: 2),
          Respuesta(idRespuesta: 3, descripcion: 'A veces', puntaje: 3),
          Respuesta(idRespuesta: 4, descripcion: 'Casi siempre', puntaje: 4),
          Respuesta(idRespuesta: 5, descripcion: 'Siempre', puntaje: 5),
        ],
      ),
    ];

    result.fold(
            (failure) => emit(PreguntaState.error(failure.toString())),
            (_) => emit(PreguntaState.listSuccess(preguntas))
    );

  }

}

// <>