import 'package:app_plataforma/src/features/pdf/presentation/cubit/pdf_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

// <>
initPdfInjections(){

  /*  Cubit   */
  sl.registerSingleton<PdfCubit>(PdfCubit());

}