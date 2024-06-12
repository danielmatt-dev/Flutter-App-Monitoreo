import 'package:app_plataforma/src/features/promedio/data/models/promedio_model.dart';
import 'package:dartz/dartz.dart';

abstract class PromedioRemoteDatasource {

  Future<Either<Exception, PromedioModel>> buscarPromedioGlucosa(int folio);

  Future<Either<Exception, PromedioModel>> buscarPromedioSistolica(int folio);

  Future<Either<Exception, PromedioModel>> buscarPromedioDiastolica(int folio);

}