import 'package:app_plataforma/src/features/valor_presion/data/models/valor_presion_request_model.dart';
import 'package:app_plataforma/src/features/valor_presion/data/models/valor_presion_response_model.dart';
import 'package:app_plataforma/src/shared/valor/models/valor_average_model.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class ValorPresionRemoteDataSource {

  Future<Either<Exception, bool>> ingresarValorPresion(ValorPresionRequestModel model);

  Future<Either<Exception, List<ValorPresionResponseModel>>> buscarValoresDelDia(int folio, String fecha);

  Future<Either<Exception, ValorAverageModel>> buscarPromedioSistolica(int folio);

  Future<Either<Exception, ValorAverageModel>> buscarPromedioDiastolica(int folio);

}