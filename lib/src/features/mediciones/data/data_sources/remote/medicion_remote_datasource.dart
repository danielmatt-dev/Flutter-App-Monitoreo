import 'package:app_plataforma/src/features/mediciones/data/models/medicion_model.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_request.dart';
import 'package:dartz/dartz.dart';

abstract class MedicionRemoteDatasource {

  Future<Either<Exception, List<MedicionModel>>> buscarConfiguracion(int folio, TipoMedicion tipo, String token);

}

// <>