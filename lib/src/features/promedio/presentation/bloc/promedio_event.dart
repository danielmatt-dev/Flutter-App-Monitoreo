part of 'promedio_bloc.dart';

@immutable
sealed class PromedioEvent { const PromedioEvent(); }

class ObtenerPromedioGlucosa extends PromedioEvent {}

class ObtenerPromedioSistolica extends PromedioEvent {}

class ObtenerPromedioDiastolica extends PromedioEvent {}
