import 'package:app_plataforma/src/features/direccion/domain/entities/direccion.dart';
import 'package:app_plataforma/src/features/direccion/domain/usecases/actualizar_direccion.dart';
import 'package:app_plataforma/src/features/direccion/domain/usecases/buscar_direccion_paciente.dart';
import 'package:app_plataforma/src/features/direccion/domain/usecases/buscar_direccion_usecase.dart';
import 'package:app_plataforma/src/features/direccion/presentation/bloc/validation/code_postal_validation.dart';
import 'package:app_plataforma/src/shared/exceptions/resource_not_found_exception.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'direccion_event.dart';
part 'direccion_state.dart';

// <>
class DireccionBloc extends Bloc<DireccionEvent, DireccionFormState> {

  final ActualizarDireccion actualizarDireccion;
  final BuscarDireccionUseCase buscarDireccion;
  final BuscarDireccionPaciente buscarDireccionPaciente;

  DireccionBloc({
    required this.actualizarDireccion,
    required this.buscarDireccion,
    required this.buscarDireccionPaciente
  }) : super(const DireccionFormState()) {
    on<CodePostalChanged>(_onCodePostalChanged);
    on<ColoniaSelected>(_onColoniaSelected);
    on<BuscarDireccion>(_onBuscarDireccion);
    on<ActualizarDireccionEvent>(_onActualizarDireccion);
    on<BuscarDireccionPacienteEvent>(_onBuscarDireccionPaciente);
  }

  void _onCodePostalChanged(
      CodePostalChanged event,
      Emitter<DireccionFormState> emitter
      ) {

    final codePostal = CodePostal.dirty(event.codePostal);

    emitter((state).copyWith(
        codePostal: codePostal,
        status: Formz.validate([
          codePostal
        ])
    ));

    if (codePostal.valid && event.codePostal.length == 5) {
      add(BuscarDireccion(event.codePostal));
    }

  }

  void _onColoniaSelected(ColoniaSelected event, Emitter<DireccionFormState> emit) {
    emit(state.copyWith(
      colonias: state.colonias,
      ciudad: state.ciudad,
      estado: state.estado,
      pais: state.pais,
      status: FormzStatus.valid,
    ));
  }

  Future<void> _onBuscarDireccion(BuscarDireccion event, Emitter<DireccionFormState> emit) async {

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final result = await buscarDireccion.call(event.codePostal);

    result.fold(
          (error) {
            if(error is ResourceNotFoundException){
              emit(state.copyWith(
                status: FormzStatus.submissionFailure,
                errorMessage: error.toString(),
              ));
              return;
            }
            emit(state.copyWith(
              status: FormzStatus.submissionCanceled,
              errorMessage: error.toString(),
            ));
            },
          (direccionResponse) => emit(state.copyWith(
        colonias: direccionResponse.colonias,
        ciudad: direccionResponse.ciudad,
        estado: direccionResponse.estado,
        pais: direccionResponse.pais,
        status: FormzStatus.valid,
      )),
    );
  }

  Future<void> _onActualizarDireccion(ActualizarDireccionEvent event, Emitter<DireccionFormState> emit) async {

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final result = await actualizarDireccion.call(
        Direccion(
          colonia: event.colonia,
          codigoPostal: state.codePostal.value,
          asentamiento: event.asentamiento,
          calle: state.calle,
          numero: state.numero,
          entreCalleUno: state.entreCalleUno,
          entreCalleDos: state.entreCalleDos,
          ciudad: state.ciudad,
          estado: state.estado,
          pais: state.pais,
        ));

    result.fold(
          (error) => emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: error.toString(),
          )),
          (success) {
            emit(state.copyWith(
              status: FormzStatus.submissionSuccess,
              codePostal: const CodePostal.pure(),
              colonias: {},
              ciudad: '',
              estado: '',
              pais: '',
            ));
      },
    );
  }

  Future<void> _onBuscarDireccionPaciente(BuscarDireccionPacienteEvent event, Emitter<DireccionFormState> emit) async {

    final result = await buscarDireccionPaciente.call(NoParams());

    result.fold(
            (error) => emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: error.toString(),
        )),
        (direccion) {
              emit(state.copyWith(
                status: FormzStatus.submissionSuccess,
                direccionMap: direccion.toMap()
              ));
        }
    );

  }

}
