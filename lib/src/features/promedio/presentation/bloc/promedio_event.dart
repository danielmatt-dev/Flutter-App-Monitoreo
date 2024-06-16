part of 'promedio_bloc.dart';

@immutable
sealed class PromedioEvent extends Equatable {

  const PromedioEvent();

  @override
  List<Object?> get props => [];

}

// Evento para obtener promedios
class ObtenerPromedios extends PromedioEvent { }
