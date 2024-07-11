import 'package:app_plataforma/src/features/valor/domain/entities/valor_request.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_response.dart';
import 'package:dartz/dartz.dart';

abstract class ValorRepository {

  Future<Either<Exception, bool>> ingresarValor(ValorRequest request);

  Future<Either<Exception, List<ValorResponse>>> buscarValoresDelDia(String fecha);

  Future<Either<Exception, bool>> generarPdf(int rango);

}