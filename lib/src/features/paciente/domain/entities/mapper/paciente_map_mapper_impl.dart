import 'package:app_plataforma/src/features/paciente/domain/entities/mapper/paciente_map_mapper.dart';
import 'package:app_plataforma/src/features/paciente/domain/entities/paciente_response.dart';

// <>
class PacienteMapMapperImpl extends PacienteMapMapper {

  @override
  Map<String, String> toMapDoctor(PacienteResponse response) {
    return {
      'Nombre': response.nombreDoctor,
      'Especialidad': response.especialidadDoctor,
      'Teléfono': response.telefonoDoctor,
      'Correo': response.correoDoctor,
    };
  }

  @override
  Map<String, String> toMapPaciente(PacienteResponse response) {
    return {
      'Nombre': response.nombre,
      'Apellido paterno': response.apellidoPaterno,
      'Apellido materno': response.apellidoMaterno,
      'Edad': '${_calculateAge(response.fechaNacimiento)} años',
      'Género': _buscarGenero(response.genero),
      'genero': response.genero,
      'Estado civil': _buscarEstadoCivil(response.estadoCivil, response.genero),
      'estadocivil': response.estadoCivil,
      'Nivel de estudios': response.nivelEstudios,
      'Miembros del hogar': '${response.numMiembrosHogar}',
      'Tipo de diabetes': response.tipoDiabetes,
      'Tiempo con diabetes': response.tiempoDiabetes,
      'Peso': '${response.peso} kgs',
      'Talla': '${response.talla} mtrs',
      'Imc': '${response.imc}  kg/m²',
      'Factor de actividad' : response.factorActividad,
      'Rmb': '${response.rmb} kcal/día',
      'Teléfono': response.telefono,
      'Correo': response.correo,
      'Tratamiento': response.nombreTratamiento,
      'Tipo de tratamiento': response.tipoTratamiento
    };
  }

  @override
  Map<String, String> toMapContacto(PacienteResponse response) {
    return {
      'Nombre': response.nombre,
      'Apellido paterno': response.apellidoPaterno,
      'Apellido materno': response.apellidoMaterno,
      'Teléfono': response.telefono,
      'Correo': response.correo
    };
  }

  @override
  Map<String, String> toMapFichaMedica(PacienteResponse response) {
    return {
      'Tipo de diabetes': response.tipoDiabetes,
      'Tiempo con diabetes': response.tiempoDiabetes,
      'Tratamiento': response.nombreTratamiento,
      'Tipo de tratamiento': response.tipoTratamiento
    };
  }

  @override
  Map<String, String> toMapFichaTecnica(PacienteResponse response) {
    return {
      'Edad': '${_calculateAge(response.fechaNacimiento)} años',
      'Fecha de nacimiento': response.fechaNacimiento.toString(),
      'Género': _buscarGenero(response.genero),
      'Estado civil': _buscarEstadoCivil(response.estadoCivil, response.genero),
      'Nivel de estudios': response.nivelEstudios,
      'Miembros del hogar': '${response.numMiembrosHogar}',
    };
  }

  @override
  Map<String, String> toMapSomatometria(PacienteResponse response) {
    return {
      'Peso': '${response.peso} kgs',
      'Talla': '${response.talla} cms',
      'Imc': '${response.imc}  kg/m²',
      'Rmb': '${response.rmb} kcal/día',
      'Factor de actividad' : response.factorActividad,
    };
  }

  String _buscarGenero(String genero) => genero == 'M' ? 'Masculino' : 'Femenino';

  String _buscarEstadoCivil(String estado, String genero) {

    if(estado == 'Unión Libre'){
      return estado;
    }

    return genero == 'M'
        ? estado.replaceAll('@', 'o')
        : estado.replaceAll('@', 'a');
  }

  int _calculateAge(DateTime birthDate) {
    final currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month || (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }

}