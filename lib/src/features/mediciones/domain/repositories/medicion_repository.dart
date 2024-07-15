import 'package:app_plataforma/src/features/mediciones/domain/entities/medicion.dart';
import 'package:dartz/dartz.dart';

abstract class MedicionRepository {

  Future<Either<Exception, List<Medicion>>> buscarMedicionesDelDia(String tipo);

}

// <>