part of 'promedio_bloc.dart';

@immutable
sealed class PromedioEvent extends Equatable {

  const PromedioEvent();

  @override
  List<Object?> get props => [];

}

class ObtenerPromedios extends PromedioEvent { }
