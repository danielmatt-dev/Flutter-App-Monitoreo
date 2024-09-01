import 'package:app_plataforma/src/features/mediciones/domain/entities/medicion.dart';
import 'package:app_plataforma/src/features/valor/domain/entities/valor_request.dart';
import 'package:dartz/dartz.dart';

abstract class MedicionRepository {

  Future<Either<Exception, List<Medicion>>> buscarMedicionesDelDia(TipoMedicion tipo);

}

// <>