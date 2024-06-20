import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/guardar_respuesta_lista.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/guardar_respuestas.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registro_respuestas_state.dart';

class RegistroRespuestasCubit extends Cubit<RegistroRespuestasState>{

  final GuardarRespuestaEnLista guardarRespuestaLista;
  final GuardarRespuestas guardarRespuestas;

  RegistroRespuestasCubit({
    required this.guardarRespuestaLista,
    required this.guardarRespuestas
  }) : super(RegistroRespuestasInicial());

  void registroRespuestasLoading(){
    emit(RegistroRespuestasLoading());
  }

  void ingresarRespuesta({
    required String idPregunta,
    required String descripcionPregunta,
    required String respuesta,
    required int puntaje,
  }) {

    emit(RegistroRespuestasInicial());

    final registro = RegistroRespuestas(
        idPregunta: idPregunta,
        descripcionPregunta: descripcionPregunta,
        respuesta: respuesta,
        puntaje: puntaje
    );

    guardarRespuestaLista.call(registro);
    emit(RegistroRespuestasAddSuccess());
  }

  Future<void> guardarListaRespuestas() async {

    emit(RegistroRespuestasLoading());

    final result = await guardarRespuestas.call(NoParams());

    result.fold(
            (failure) => emit(RegistroRespuestasError(error: failure.toString())),
            (success) => emit(RegistroRespuestasSaveSuccess(success: success))
    );
  }

}

// <>