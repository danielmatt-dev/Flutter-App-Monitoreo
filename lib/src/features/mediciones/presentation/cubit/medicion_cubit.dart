import 'package:app_plataforma/src/features/mediciones/domain/usecases/buscar_mediciones_del_dia.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicion_state.dart';
part 'medicion_cubit.freezed.dart';

class MedicionCubit extends Cubit<MedicionState>{

  final BuscarMedicionesDelDia buscarMediciones;

  MedicionCubit({
    required this.buscarMediciones
  }): super(const MedicionState.initial());

  Future<void> buscarMedicion(String tipo) async {

    emit(const MedicionState.initial());

    final result = await buscarMediciones.call(tipo);

    result.fold(
            (failure) {
              emit(MedicionState.error(failure.toString()));
            },
            (mediciones) {

              if(mediciones.isEmpty){
                emit(const MedicionState.emptyList());
              }

              emit(MedicionState.listSuccess(mediciones));
            }
    );

  }


}

// <>
