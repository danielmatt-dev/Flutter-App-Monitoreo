import 'package:app_plataforma/src/features/doctor/data/models/doctor_model.dart';
import 'package:app_plataforma/src/features/doctor/domain/entities/doctor.dart';
import 'package:smartstruct/smartstruct.dart';

part 'doctor_mapper.mapper.g.dart';

@Mapper()
abstract class DoctorMapper {

  Doctor toDoctor(DoctorModel model);

}