import 'package:app_plataforma/src/features/doctor/domain/entities/doctor.dart';
import 'package:app_plataforma/src/features/doctor/domain/repositories/doctor_repository.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class BuscarDoctores extends UseCase<List<Doctor>, NoParams> {

  final DoctorRepository _repository;

  BuscarDoctores(DoctorRepository repository): _repository = repository;

  @override
  Future<Either<Exception, List<Doctor>>> call(NoParams params) async =>
      _repository.buscarDoctores();

}