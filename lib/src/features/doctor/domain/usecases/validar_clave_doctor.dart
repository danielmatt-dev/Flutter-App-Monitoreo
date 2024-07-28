import 'package:app_plataforma/src/features/doctor/domain/repositories/doctor_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class ValidarClaveDoctor extends UseCase<bool, String> {

  final DoctorRepository _repository;

  ValidarClaveDoctor(DoctorRepository repository): _repository = repository;

  @override
  Future<Either<Exception, bool>> call(String params) async =>
      _repository.validarClaveDoctor(params);

}