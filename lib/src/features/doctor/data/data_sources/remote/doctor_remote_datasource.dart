import 'package:app_plataforma/src/features/doctor/data/models/doctor_model.dart';
import 'package:dartz/dartz.dart';

// <>
abstract class DoctorRemoteDatasource {

  Future<Either<Exception, List<DoctorModel>>> buscarDoctores(String token);

  Future<Either<Exception, bool>> validarClaveDoctor(String clave, String token);

}