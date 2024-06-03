import 'package:app_plataforma/src/features/paciente/data/data_sources/remote/paciente_remote_datasource.dart';
import 'package:app_plataforma/src/features/paciente/data/models/mapper/paciente_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente.dart';
import 'package:app_plataforma/src/features/paciente/domain/repositories/paciente_repository.dart';
import 'package:dartz/dartz.dart';

class PacienteAdapter extends PacienteRepository {

  final PacienteRemoteDatasource remote;
  final PacienteMapper mapper;

  PacienteAdapter({
    required this.remote,
    required this.mapper
  });

  @override
  Future<Either<Exception, Paciente>> buscarPaciente(String idPaciente) async {

    final response = await remote.buscarPacientePorId(idPaciente);

    return response.fold(
            (failure) => Left(failure),
            (model) => Right(mapper.toPaciente(model))
    );

  }

}