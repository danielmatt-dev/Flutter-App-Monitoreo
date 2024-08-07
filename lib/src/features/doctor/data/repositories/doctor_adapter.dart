import 'package:app_plataforma/src/features/auth_response/domain/repositories/auth_repository.dart';
import 'package:app_plataforma/src/features/doctor/data/data_sources/remote/doctor_remote_datasource.dart';
import 'package:app_plataforma/src/features/doctor/data/models/mapper/doctor_mapper.dart';
import 'package:app_plataforma/src/features/doctor/domain/entities/doctor.dart';
import 'package:app_plataforma/src/features/doctor/domain/repositories/doctor_repository.dart';
import 'package:dartz/dartz.dart';

class DoctorAdapter extends DoctorRepository {

  final DoctorRemoteDatasource _remote;
  final DoctorMapper _mapper;
  final AuthRepository _local;

  DoctorAdapter(DoctorRemoteDatasource remoteDatasource, DoctorMapper mapper, AuthRepository local)
      : _remote = remoteDatasource, _mapper = mapper, _local = local;

  @override
  Future<Either<Exception, List<Doctor>>> buscarDoctores() async {

    final response = await _remote.buscarDoctores(_local.getToken());

    return response.fold(
            (l) => Left(l),
            (models) => Right(models.map((model) => _mapper.toDoctor(model)).toList())
    );

  }

  @override
  Future<Either<Exception, bool>> validarClaveDoctor(String clave) async =>
      await _remote.validarClaveDoctor(clave, _local.getToken());

}