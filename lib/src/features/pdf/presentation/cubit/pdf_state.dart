part of 'pdf_cubit.dart';

@immutable
sealed class PdfState extends Equatable {

  const PdfState();

  @override
  List<Object?> get props => [];

}

class PdfInitial extends PdfState {}

class PdfSuccess extends PdfState {

  final List<int> valores;

  const PdfSuccess(this.valores);

  @override
  List<Object?> get props => [valores];

}

class PdfError extends PdfState {

  final String error;

  const PdfError(this.error);

  @override
  List<Object?> get props => [error];

}