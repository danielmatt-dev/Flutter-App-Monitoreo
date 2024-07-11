import 'package:app_plataforma/src/shared/utils/base_url.dart';

class ValorGlucosaEndpoints {

  static const findListValorGlucosaByDia = '$baseUrl/glucosa/dia';
  static const generatePdf = '$baseUrl/reporte/pdf/glucosa';
  static const saveValorGlucosa = '$baseUrl/glucosa/ingresar';
  static const averageValorGlucosa = '$baseUrl/glucosa/promedio/';

}