import 'package:app_plataforma/src/features/reporte/presentation/cubit/reporte_cubit.dart';
import 'package:app_plataforma/src/features/reporte/usecases/generar_pdf_glucosa.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

// <>
initReporteInjections() {

  sl.registerSingleton<GenerarPdfGlucosa>(GenerarPdfGlucosa(sl()));

  /*  Cubit   */
  sl.registerSingleton<ReporteCubit>(ReporteCubit(generarReporteGlucosa: sl()));

}