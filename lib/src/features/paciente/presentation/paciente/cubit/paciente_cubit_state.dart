part of 'paciente_cubit.dart';

@immutable
sealed class PacienteCubitState extends Equatable {

  const PacienteCubitState();

  @override
  List<Object?> get props => [];

}

class PacienteCubitLoading extends PacienteCubitState {}

class PacienteCubitSuccess extends PacienteCubitState {

  final Map<String, String> mapContacto;
  final Map<String, String> mapFichaTecnica;
  final Map<String, String> mapSomatometria;
  final Map<String, String> mapFichaMedica;
  final Map<String, String> mapDoctor;
  final Map<String, String> mapData;

  const PacienteCubitSuccess(
      this.mapContacto,
      this.mapFichaTecnica,
      this.mapSomatometria,
      this.mapFichaMedica,
      this.mapDoctor,
      this.mapData
      );

  @override
  List<Object?> get props => [
    mapContacto,
    mapFichaTecnica,
    mapSomatometria,
    mapFichaMedica,
    mapDoctor,
    mapData
  ];

}

class PacienteCubitError extends PacienteCubitState {

  final String message;

  const PacienteCubitError(this.message);

  @override
  List<Object?> get props => [message];

}