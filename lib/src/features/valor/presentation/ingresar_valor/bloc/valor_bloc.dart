import 'package:app_plataforma/src/features/valor/domain/entities/impl/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/impl/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/glucosa/ingresar_valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor/domain/usecases/presion/ingresar_valor_presion.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/bloc/validation/valor_diastolica.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/bloc/validation/valor_glucosa.dart';
import 'package:app_plataforma/src/features/valor/presentation/ingresar_valor/bloc/validation/valor_sistolica.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'valor_event.dart';
part 'valor_state.dart';

// <>
class ValorBloc extends Bloc<ValorEvent, ValorState>{

  final IngresarValorGlucosa ingresarValorGlucosa;
  final IngresarValorPresion ingresarValorPresion;

  ValorBloc({
    required this.ingresarValorGlucosa,
    required this.ingresarValorPresion
  }) : super (const GlucosaFormState()) {
    on<InitializeForm>(_onInitializeForm);
    on<GlucosaChanged>(_onGlucosaChanged);
    on<SistolicaChanged>(_onSistolicaChanged);
    on<DiastolicaChanged>(_onDiastolicaChanged);
    on<SubmitGlucosaForm>(_onSubmitGlucosaForm);
    on<SubmitPresionForm>(_onSubmitPresionForm);
  }

  void _onInitializeForm(InitializeForm event, Emitter<ValorState> emit) {
    if (event.isGlucose) {
      emit(const GlucosaFormState());
    } else {
      emit(const PresionFormState());
    }
  }

  void _onSistolicaChanged(SistolicaChanged event, Emitter<ValorState> emit) {
    final currentState = state;
    if (currentState is PresionFormState) {
      final valorSistolica = ValorSistolica.dirty(event.sistolica);
      emit(currentState.copyWith(
        valorSistolica: valorSistolica,
        status: Formz.validate([valorSistolica, currentState.valorDiastolica]),
        showErrorMessages: true,
      ));
    }
  }

  void _onDiastolicaChanged(DiastolicaChanged event, Emitter<ValorState> emit) {
    final currentState = state;
    if (currentState is PresionFormState) {
      final valorDiastolica = ValorDiastolica.dirty(event.diastolica);
      emit(currentState.copyWith(
        valorDiastolica: valorDiastolica,
        status: Formz.validate([currentState.valorSistolica, valorDiastolica]),
        showErrorMessages: true,
      ));
    }
  }

  void _onGlucosaChanged(GlucosaChanged event, Emitter<ValorState> emit) {
    final currentState = state;
    if (currentState is GlucosaFormState) {
      final valorGlucosa = ValorGlucosa.dirty(measurement: event.measurement, value: event.glucosa);
      emit(currentState.copyWith(
        valorGlucosa: valorGlucosa,
        status: Formz.validate([valorGlucosa]),
        showErrorMessages: true,
      ));
    }
  }

  void _onSubmitGlucosaForm(SubmitGlucosaForm event, Emitter<ValorState> emit) async {

    final currentState = state as GlucosaFormState;

    emit(currentState.copyWith(status: FormzStatus.submissionInProgress));

    final va = ValorGlucosaRequest(
      valor: int.parse(event.valor),
      medicion: event.medicion,
      notas: event.notas,
    );

    final result = await ingresarValorGlucosa.call(va);

    result.fold(
          (failure) => emit(currentState.copyWith(status: FormzStatus.submissionFailure, error: failure.toString())),
          (success) => emit(ValorSaveSuccess()),
    );
  }

  void _onSubmitPresionForm(SubmitPresionForm event, Emitter<ValorState> emit) async {
    final currentState = state as PresionFormState;

    emit(currentState.copyWith(status: FormzStatus.submissionInProgress));

    final result = await ingresarValorPresion.call(
      ValorPresionRequest(
        valorSistolica: int.parse(event.valorSistolica),
        valorDiastolica: int.parse(event.valorDiastolica),
        medicion: event.medicion,
        notas: event.notas,
      ),
    );

    print(result);

    result.fold(
          (failure) => emit(currentState.copyWith(status: FormzStatus.submissionFailure, error: failure.toString())),
          (success) => emit(ValorSaveSuccess()),
    );
  }
}