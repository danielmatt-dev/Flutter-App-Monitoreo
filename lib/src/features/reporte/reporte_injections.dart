import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'presentation/cubit/pdf_cubit.dart';

// <>
initReporteInjections(){

  /*  Cubit   */
  sl.registerSingleton<PdfCubit>(PdfCubit());

}