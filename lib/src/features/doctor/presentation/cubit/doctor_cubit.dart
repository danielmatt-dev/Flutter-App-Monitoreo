import 'package:app_plataforma/src/features/doctor/domain/entities/doctor.dart';
import 'package:app_plataforma/src/features/doctor/domain/usecases/buscar_doctores.dart';
import 'package:app_plataforma/src/features/doctor/domain/usecases/validar_clave_doctor.dart';
import 'package:app_plataforma/src/features/doctor/presentation/cubit/validaciones/clave_doctor_validation.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {

  final BuscarDoctores buscarDoctoresUseCase;
  final ValidarClaveDoctor validarClaveDoctorUseCase;

  DoctorCubit({
    required this.buscarDoctoresUseCase,
    required this.validarClaveDoctorUseCase,
  }) : super(DoctorInitial());

  Future<void> buscarDoctores() async {
    final response = await buscarDoctoresUseCase.call(NoParams());

    response.fold(
            (l) => emit(DoctorError(l.toString())),
            (doctores) {
          if (doctores.isEmpty) {
            emit(DoctorEmptyList());
            return;
          }
          emit(DoctorLoadSuccess(doctores));
        }
    );
  }

  Future<void> validarClaveDoctor(String clave) async {
    final response = await validarClaveDoctorUseCase.call(clave);

    response.fold(
            (l) => emit(DoctorError(l.toString())),
            (r) => emit(ValidarClaveDoctorSuccess())
    );
  }

  void onClaveDoctorChanged(String value) {
    final clave = Clave.dirty(value);

    emit(ClaveFormState(clave: clave, status: Formz.validate([clave])));
  }

}
