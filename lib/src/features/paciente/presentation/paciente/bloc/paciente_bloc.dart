import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente_por_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'paciente_event.dart';
part 'paciente_state.dart';

class PacienteBloc extends Bloc<PacienteEvent, PacienteState>{

  final BuscarPacientePorId buscarPacientePorId;

  PacienteBloc({
    required this.buscarPacientePorId
  }) : super(PacienteInicial()) {
    on<ObtenerPacientePorId>(_obtenerPacientePorId);
  }

  _obtenerPacientePorId(
      ObtenerPacientePorId event,
      Emitter<PacienteState> emitter) async {

    emitter(PacienteLoading());

    final result = await buscarPacientePorId.call(event.id);

    result.fold(
            (failure) => emitter(PacienteError(failure.toString())),
            (paciente) => emitter(PacienteSuccess(paciente))
    );

  }

}

// <>