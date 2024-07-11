part of 'reporte_cubit.dart';

@immutable
sealed class ReporteState extends Equatable {

  const ReporteState();

  factory ReporteState.initial() => PdfInitial();
  factory ReporteState.loading() => PdfLoading();
  factory ReporteState.glucosaSuccess() => PdfGlucosaSuccess();
  factory ReporteState.presionSuccess() => PdfPresionSuccess();
  factory ReporteState.error(String message) => PdfError(message);

  @override
  List<Object?> get props => [];

}

class PdfInitial extends ReporteState {}

class PdfLoading extends ReporteState {}

class PdfGlucosaSuccess extends ReporteState {}

class PdfPresionSuccess extends ReporteState {}

class PdfError extends ReporteState {

  final String error;

  const PdfError(this.error);

  @override
  List<Object?> get props => [error];

}