import 'package:app_plataforma/src/features/valor/domain/entities/valor_request.dart';

class ValorGlucosaRequest extends ValorRequest {

  final int valor;

  ValorGlucosaRequest({
    required this.valor,
    required super.medicion,
    required super.notas
  });

}