import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'pdf_state.dart';

// <>
class PdfCubit extends Cubit<PdfState> {

  PdfCubit(): super(PdfInitial());

  void generarPdf({required int rango, required String medicion}){

    if(rango != 4 || rango != 8 || rango != 12 ){
      emit(const PdfError('Rango no válido'));
    }

    final valores = [1, 2, 3];

    print('$valores, $rango, $medicion');
    emit(PdfSuccess(valores));

  }

}