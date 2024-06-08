import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_request.dart';
import 'package:app_plataforma/src/features/valor_glucosa/domain/entities/valor_glucosa_response.dart';
import 'package:dartz/dartz.dart';

abstract class ValorGlucosaRepository {

  Future<Either<Exception, List<ValorGlucosaResponse>>> buscarValoresGlucosaDelDia(int folio, String fecha);

  Future<Either<Exception, bool>> ingresarValorGlucosa(ValorGlucosaRequest request);

  Future<Either<Exception, double>> promedioGlucosa(int folio);

}

// <>