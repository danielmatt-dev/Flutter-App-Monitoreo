import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento_paciente.dart';
import 'package:dartz/dartz.dart';

abstract class TratamientoRepository {

  Future<Either<Exception, List<Tratamiento>>> buscarTratamientos();

  Future<Either<Exception, TratamientoPaciente>> buscarTratamientosPaciente();

  Future<Either<Exception, bool>> guardarTratamientos(TratamientoPaciente entity);

}