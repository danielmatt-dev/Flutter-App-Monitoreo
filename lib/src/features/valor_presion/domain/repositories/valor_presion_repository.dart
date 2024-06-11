import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_request.dart';
import 'package:app_plataforma/src/features/valor_presion/domain/entities/valor_presion_response.dart';
import 'package:app_plataforma/src/shared/valor/entities/valor_average.dart';
import 'package:dartz/dartz.dart';

abstract class ValorPresionRepository {

  Future<Either<Exception, List<ValorPresionResponse>>> buscarValoresPresionDelDia(String fecha);

  Future<Either<Exception, bool>> ingresarValorPresion(ValorPresionRequest request);

  Future<Either<Exception, ValorAverage>> buscarPromedioSistolica();

  Future<Either<Exception, ValorAverage>> buscarPromedioDiastolica();

}

// <>