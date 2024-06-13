import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor_response/domain/entities/valor_response.dart';
import 'package:dartz/dartz.dart';

abstract class ValorPresionRepository {

  Future<Either<Exception, List<ValorResponse>>> buscarValoresPresionDelDia(String fecha);

  Future<Either<Exception, bool>> ingresarValorPresion(ValorPresionRequest request);

}

// <>