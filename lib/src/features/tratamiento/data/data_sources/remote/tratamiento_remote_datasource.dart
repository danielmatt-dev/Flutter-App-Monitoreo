import 'package:app_plataforma/src/features/tratamiento/data/models/tratamiento_model.dart';
import 'package:app_plataforma/src/features/tratamiento/data/models/tratamiento_paciente_model.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class TratamientoRemoteDatasource {

  Future<Either<Exception, List<TratamientoModel>>> buscarTratamientos(String token);

  Future<Either<Exception, TratamientoPacienteModel>> buscarTratamientosPaciente(int folio, String token);

  Future<Either<Exception, bool>> guardarTratamientos(TratamientoPacienteModel model, String token);

}