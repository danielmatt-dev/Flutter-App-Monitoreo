import 'package:app_plataforma/src/features/preguntas/domain/entities/pregunta.dart';
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

    result.fold(
            (failure) => emit(PreguntaState.error(failure.toString())),
            (preguntas) => emit(PreguntaState.listSuccess(preguntas))
    );

  }

}

// <>