import 'package:app_plataforma/src/features/doctor/domain/entities/doctor.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorRepository {

  Future<Either<Exception, List<Doctor>>> buscarDoctores();

  Future<Either<Exception, bool>> validarClaveDoctor(String clave);

}