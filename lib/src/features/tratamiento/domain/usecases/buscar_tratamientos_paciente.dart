import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento_paciente.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/repositories/tratamiento_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class BuscarTratamientosPaciente extends UseCase<TratamientoPaciente, NoParams> {

  final TratamientoRepository _repository;

  BuscarTratamientosPaciente(TratamientoRepository repository): _repository = repository;

  @override
  Future<Either<Exception, TratamientoPaciente>> call(NoParams params) =>
      _repository.buscarTratamientosPaciente();

}