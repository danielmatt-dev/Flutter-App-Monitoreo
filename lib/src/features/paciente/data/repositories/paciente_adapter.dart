import 'package:dartz/dartz.dart';
import '../../domain/entities/paciente.dart';
import '../../domain/repositories/paciente_repository.dart';
import '../data_sources/remote/paciente_remote_datasource.dart';
import '../models/mapper/paciente_mapper.dart';

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