import 'dart:io';

import 'package:app_plataforma/src/features/valor/data/models/valor_request_model.dart';
import 'package:app_plataforma/src/features/valor/data/models/valor_response_model.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class ValorRemoteDataSource {

  Future<Either<Exception, bool>> ingresarValor(ValorRequestModel model);

  Future<Either<Exception, List<ValorResponseModel>>> buscarValoresDelDia(int folio, String fecha);

  Future<Either<Exception, File>> generarPdf(int folio, int rango);

}