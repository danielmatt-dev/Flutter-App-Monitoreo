part of 'doctor_cubit.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorEmptyList extends DoctorState {}

class DoctorLoadSuccess extends DoctorState {

  final List<Doctor> doctores;

  const DoctorLoadSuccess(this.doctores);

  @override
  List<Object> get props => [doctores];

}

class DoctorError extends DoctorState {
  final String message;

  const DoctorError(this.message);

  @override
  List<Object> get props => [message];
}

class ValidarClaveDoctorSuccess extends DoctorState {}
