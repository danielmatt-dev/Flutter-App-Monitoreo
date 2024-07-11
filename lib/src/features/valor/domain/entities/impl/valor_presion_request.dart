import 'package:app_plataforma/src/features/valor/domain/entities/valor_request.dart';

class ValorPresionRequest extends ValorRequest {

  final int valorSistolica;
  final int valorDiastolica;

  ValorPresionRequest({
    required this.valorSistolica,
    required this.valorDiastolica,
    required super.medicion,
    required super.notas
  });

}