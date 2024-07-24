import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:dartz/dartz.dart';

abstract class TratamientoRepository {

  Future<Either<Exception, List<Tratamiento>>> buscarTratamientos();

}