import 'package:app_plataforma/src/features/valor/domain/usecases/glucosa/generar_pdf_glucosa.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'reporte_state.dart';

// <>
class ReporteCubit extends Cubit<ReporteState> {

  final GenerarPdfGlucosa generarReporteGlucosa;

  ReporteCubit({required this.generarReporteGlucosa}): super(ReporteState.initial());

  void generarPdf({required int rango, required String medicion}) async {

    if(rango != 4 || rango != 8 || rango != 12 ){
      emit(const PdfError('Rango no válido'));
    }

    if(medicion == 'glucosa'){
      final result = await generarReporteGlucosa.call(rango);

      return result.fold(
              (failure) => emit(ReporteState.error('message')),
              (success) => emit(ReporteState.glucosaSuccess())
      );

    }


    final valores = [1, 2, 3];

    print('$valores, $rango, $medicion');

    //emit(ReporteState.presionSuccess());

  }

}