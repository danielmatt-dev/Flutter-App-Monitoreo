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

    if(tipoPregunta == TipoPregunta.somatometria){
      final preguntas = [
        Pregunta(
          idPregunta: 32,
          pregunta: '¿Has experimentado sensación de adormecimiento, hormigueo o ardor en alguna parte del cuerpo?',
          respuestas: [
            Respuesta(idRespuesta: 20, descripcion: 'No', puntaje: 1),
            //Respuesta(idRespuesta: 21, descripcion: 'Sí', puntaje: 2),
            Respuesta(idRespuesta: 48, descripcion: 'Manos', puntaje: 0),
            Respuesta(idRespuesta: 49, descripcion: 'Pies', puntaje: 0),
            Respuesta(idRespuesta: 50, descripcion: 'Brazos', puntaje: 0),
            Respuesta(idRespuesta: 51, descripcion: 'Piernas', puntaje: 0),
          ],
        ),
        Pregunta(
          idPregunta: 33,
          pregunta: '¿Consideras que tu visión es adecuada o has experimentado visión borrosa?',
          respuestas: [
            Respuesta(idRespuesta: 52, descripcion: 'Mi visión es adecuada', puntaje: 0),
            Respuesta(idRespuesta: 53, descripcion: 'He experimentado visión borrosa', puntaje: 0),
            Respuesta(idRespuesta: 54, descripcion: 'A veces tengo visión borrosa', puntaje: 0),
            Respuesta(idRespuesta: 55, descripcion: 'Uso lentes o gafas', puntaje: 0),
          ],
        ),
      ];

      emit(PreguntaState.listSuccess(preguntas));
      return;
    }

    final result = await buscarPreguntas.call(tipoPregunta);

    result.fold(
            (failure) => emit(PreguntaState.error(failure.toString())),
            (preguntas) => emit(PreguntaState.listSuccess(preguntas))
    );

  }

}

// <>