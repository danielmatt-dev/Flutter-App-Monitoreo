import 'package:app_plataforma/src/features/comentario/domain/usecases/guadar_comentario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comentario_state.dart';

class ComentarioCubit extends Cubit<ComentarioState> {

  final GuardarComentario guardarComentario;

  ComentarioCubit({
    required this.guardarComentario
  }) : super(ComentarioLoading());

  Future<void> guardarComentarioEvent(String comentario) async {

    emit(ComentarioInitial());

    final result = await guardarComentario.call(comentario);

    result.fold(
        (failure) => emit(ComentarioError()),
        (success) => emit(ComentarioSucess()));
  }

}