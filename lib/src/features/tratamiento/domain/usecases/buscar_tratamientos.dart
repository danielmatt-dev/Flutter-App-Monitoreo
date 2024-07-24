import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/features/tratamiento/domain/repositories/tratamiento_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

// <>
class BuscarTratamientos extends UseCase<List<Tratamiento>, NoParams> {

  final TratamientoRepository _repository;

  BuscarTratamientos(TratamientoRepository repository): _repository = repository;

  @override
  Future<Either<Exception, List<Tratamiento>>> call(NoParams params) async =>
      await _repository.buscarTratamientos();

}