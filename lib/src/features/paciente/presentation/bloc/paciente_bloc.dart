import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/paciente.dart';
import '../../domain/usecases/buscar_paciente_por_id.dart';

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