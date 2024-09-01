import 'package:app_plataforma/src/features/mediciones/domain/usecases/buscar_mediciones_del_dia.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_request.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicion_state.dart';
part 'medicion_cubit.freezed.dart';

class MedicionCubit extends Cubit<MedicionState>{

  final BuscarMedicionesDelDia buscarMediciones;

  MedicionCubit({
    required this.buscarMediciones
  }): super(const MedicionState.initial());

  Future<void> buscarMedicion(TipoMedicion tipo) async {

    emit(const MedicionState.initial());

    final result = await buscarMediciones.call(tipo);

    result.fold(
            (failure) {
              emit(MedicionState.error(failure.toString()));
            },
            (mediciones) {

              mediciones = ["Antes del desayuno", "Ants de la cena"];

              mediciones.isNotEmpty
                  ? emit(MedicionState.listSuccess(mediciones))
                  : emit(const MedicionState.emptyList());
            }
    );

  }

}

// <>