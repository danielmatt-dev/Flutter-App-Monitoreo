import 'package:app_plataforma/src/features/paciente/domain/entities/mapper/paciente_map_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_response.dart';
import 'package:app_plataforma/src/features/paciente/domain/usecases/buscar_paciente.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'paciente_cubit_state.dart';

class PacienteCubit extends Cubit<PacienteCubitState> {

  final BuscarPaciente buscarPaciente;
  final PacienteMapMapper mapper;

  PacienteCubit({
    required this.buscarPaciente,
    required this.mapper,
  }): super(PacienteCubitLoading());

  Future<void> buscarDatosPaciente() async {

    /*
    final result = await buscarPaciente.call(NoParams());

    result.fold(
            (failure) => emit(PacienteCubitError(failure.toString())),
            (paciente) {

              final mapContacto = mapper.toMapContacto(paciente);
              final mapTecnica = mapper.toMapFichaTecnica(paciente);
              final mapSomatometria = mapper.toMapSomatometria(paciente);
              final mapMedica = mapper.toMapFichaMedica(paciente);
              final mapDoctor = mapper.toMapDoctor(paciente);

              final mapData = {
                ...mapContacto,
                ...mapTecnica,
                ...mapSomatometria,
                ...mapMedica
              };

              emit(PacienteCubitSuccess(
                  mapContacto, mapTecnica, mapSomatometria, mapMedica, mapDoctor,
                  mapData));
            }
    );

     */

    final paciente = PacienteResponse(
      folio: 22,
      nombre: "Daniel",
      apellidoPaterno: "Martínez",
      apellidoMaterno: "González",
      fechaNacimiento: DateTime.parse("2004-07-15"),
      genero: "Hombre",
      estadoCivil: "Solter@",
      nivelEstudios: "Ninguno",
      numMiembrosHogar: 3,
      tipoDiabetes: "Tipo 2",
      tiempoDiabetes: "Menos de 1 año",
      peso: 96.0,
      talla: 180.0,
      imc: 29.63,
      caloriasDia: 2736.0,
      telefono: "5551234123",
      correo: "danilo12@gmail.com",
      factorActividad: "Intensa",
      claveDoctor: "DMG-0001",
      nombreDoctor: "Daniel Martínez González",
      especialidadDoctor: "Endocrinología",
      telefonoDoctor: "1234567890",
      correoDoctor: "correo@example.com",
    );

    final mapContacto = mapper.toMapContacto(paciente);
    final mapTecnica = mapper.toMapFichaTecnica(paciente);
    final mapSomatometria = mapper.toMapSomatometria(paciente);
    final mapMedica = mapper.toMapFichaMedica(paciente);
    final mapDoctor = mapper.toMapDoctor(paciente);

    final mapData = {
      ...mapContacto,
      ...mapTecnica,
      ...mapSomatometria,
      ...mapMedica
    };

    emit(PacienteCubitSuccess(mapContacto, mapTecnica, mapSomatometria, mapMedica, mapDoctor, mapData));

  }

}