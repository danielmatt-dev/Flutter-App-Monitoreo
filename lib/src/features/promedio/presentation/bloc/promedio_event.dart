part of 'promedio_bloc.dart';

@immutable
sealed class PromedioEvent { const PromedioEvent(); }

class ObtenerPromedios extends PromedioEvent {}
