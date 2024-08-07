import 'package:app_plataforma/src/features/mediciones/data/models/medicion_model.dart';
import 'package:dartz/dartz.dart';

abstract class MedicionRemoteDatasource {

  Future<Either<Exception, List<MedicionModel>>> buscarConfiguracion(int folio, String tipo, String token);

}

// <>