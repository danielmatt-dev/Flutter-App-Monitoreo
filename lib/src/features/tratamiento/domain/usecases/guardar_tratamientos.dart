import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento_paciente.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/repositories/tratamiento_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class GuardarTratamientos extends UseCase<bool, TratamientoPaciente> {

  final TratamientoRepository _repository;

  GuardarTratamientos(TratamientoRepository repository): _repository = repository;

  @override
  Future<Either<Exception, bool>> call(TratamientoPaciente params) =>
      _repository.guardarTratamientos(params);

}