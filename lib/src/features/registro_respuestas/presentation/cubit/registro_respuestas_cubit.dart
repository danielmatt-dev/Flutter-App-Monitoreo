import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/crear_registro_respuesta.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/guardar_respuesta_lista.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/guardar_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/obtener_lista_registros.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'registro_respuestas_state.dart';

class RegistroRespuestasCubit extends Cubit<RegistroRespuestasState>{

  final CrearRegistroRespuesta crearRegistroRespuesta;
  final GuardarRespuestaEnLista guardarRespuestaLista;
  final GuardarRespuestas guardarRespuestas;
  final ObtenerListaRegistros obtenerListaRespuestas;

  RegistroRespuestasCubit({
    required this.crearRegistroRespuesta,
    required this.guardarRespuestaLista,
    required this.guardarRespuestas,
    required this.obtenerListaRespuestas
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

    final registro = crearRegistroRespuesta.call(
        CrearRegistroRespuestaParams(
            idPregunta: idPregunta,
            descripcionPregunta: descripcionPregunta,
            respuesta: respuesta,
            puntaje: puntaje
        )
    );
    guardarRespuestaLista.call(registro);
    emit(RegistroRespuestasAddSuccess());
  }

  Future<void> guardarListaRespuestas() async {

    emit(RegistroRespuestasLoading());

    final result = await guardarRespuestas.call(obtenerListaRespuestas.call());

    result.fold(
            (failure) => emit(RegistroRespuestasError(error: failure.toString())),
            (success) => emit(RegistroRespuestasSaveSuccess(success: success))
    );
  }

}

// <>