import 'package:app_plataforma/src/features/tratamiento/data/models/tratamiento_model.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class TratamientoRemoteDatasource {

  Future<Either<Exception, List<TratamientoModel>>> buscarTratamientos(String token);

}