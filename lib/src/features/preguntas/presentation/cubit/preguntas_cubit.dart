import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
import 'package:app_plataforma/src/features/preguntas/domain/usecases/buscar_preguntas.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'preguntas_state.dart';

class PreguntasCubit extends Cubit<PreguntaState>{

  final BuscarPreguntas buscarPreguntas;

  PreguntasCubit({required this.buscarPreguntas}) : super(PreguntaInicial());

  void preguntaLoading(){
    emit(PreguntaLoading());
  }

  Future<void> preguntasCargadas() async {

    emit(PreguntaLoading());

    final result = await buscarPreguntas.call(NoParams());

    result.fold(
            (failure) => emit(PreguntaError(error: failure.toString())),
            (preguntas) => emit(PreguntaListSuccess(preguntas: preguntas))
    );

  }

}

// <>