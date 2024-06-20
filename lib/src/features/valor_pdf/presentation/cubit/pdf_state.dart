part of 'pdf_cubit.dart';

@immutable
sealed class PdfState extends Equatable {

  const PdfState();

  factory PdfState.initial() => PdfInitial();
  factory PdfState.loading() => PdfLoading();
  factory PdfState.glucosaSuccess(List<int> valores) => PdfGlucosaSuccess(valores);
  factory PdfState.presionSuccess(List<int> valores) => PdfPresionSuccess(valores);
  factory PdfState.error(String message) => PdfError(message);

  @override
  List<Object?> get props => [];

}

class PdfInitial extends PdfState {}

class PdfLoading extends PdfState {}

class PdfGlucosaSuccess extends PdfState {

  final List<int> valores;

  const PdfGlucosaSuccess(this.valores);

  @override
  List<Object?> get props => [valores];

}

class PdfPresionSuccess extends PdfState {

  final List<int> valores;

  const PdfPresionSuccess(this.valores);

  @override
  List<Object?> get props => [valores];

}

class PdfError extends PdfState {

  final String error;

  const PdfError(this.error);

  @override
  List<Object?> get props => [error];

}