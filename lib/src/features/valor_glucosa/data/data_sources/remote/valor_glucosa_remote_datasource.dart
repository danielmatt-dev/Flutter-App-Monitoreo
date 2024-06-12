import 'package:app_plataforma/src/features/valor_glucosa/data/models/valor_glucosa_request_model.dart';
import 'package:app_plataforma/src/features/valor_glucosa/data/models/valor_glucosa_response_model.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class ValorGlucosaRemoteDataSource {

  Future<Either<Exception, bool>> ingresarValorGlucosa(ValorGlucosaRequestModel model);

  Future<Either<Exception, List<ValorGlucosaResponseModel>>> buscarValoresDelDia(int folio, String fecha);

}