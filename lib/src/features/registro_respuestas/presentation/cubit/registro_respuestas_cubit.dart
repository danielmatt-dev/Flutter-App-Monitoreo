import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/usecases/guardar_respuestas.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registro_respuestas_state.dart';

class RegistroRespuestasCubit extends Cubit<RegistroRespuestasState>{

  final GuardarRespuestas guardarRespuestas;

  RegistroRespuestasCubit({
    required this.guardarRespuestas
  }) : super(RegistroRespuestasInicial());

  void registroRespuestasLoading(){
    emit(RegistroRespuestasLoading());
  }

  Future<void> guardarListaRespuestas(Map<int, RegistroRespuestas> respuestas) async {

    emit(RegistroRespuestasLoading());

    final result = await guardarRespuestas.call(respuestas);

    result.fold(
            (failure) => emit(RegistroRespuestasError(error: failure.toString())),
            (success) => emit(RegistroRespuestasSaveSuccess())
    );
  }

}

// <>