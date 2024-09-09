import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ValidationsRegisterMain {

  final BuildContext context;

  ValidationsRegisterMain({required this.context});

  void showSnackBar({String title = 'Campo necesario', required String message}) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      CustomSnackbar.show(
        context: context,
        typeMessage: TypeMessage.warning,
        title: title,
        description: message,
      );
    });
  }

  bool validateDataSheetScreen({
    required String estadoCivil,
    required String estudios,
    required String fechaNacimiento,
  }) {
    bool esMayorDeEdad(String fecha) {
      DateTime fechaNacimiento = DateTime.parse(fecha);
      DateTime fechaActual = DateTime.now();
      int edad = fechaActual.year - fechaNacimiento.year;

      if (fechaActual.month < fechaNacimiento.month ||
          (fechaActual.month == fechaNacimiento.month && fechaActual.day < fechaNacimiento.day)) {
        edad--;
      }

      return edad >= 18;
    }

    if (estadoCivil.isEmpty) {
      showSnackBar(message: 'Por favor, escoja su estado civil');
      return false;
    }

    if (estudios.isEmpty) {
      showSnackBar(message: 'Por favor, escoja su nivel de estudios');
      return false;
    }

    if (DateTime.parse(fechaNacimiento) == DateTime.now()) {
      showSnackBar(message: 'Por favor, escoja su fecha de nacimiento');
      return false;
    }

    if (!esMayorDeEdad(fechaNacimiento)) {
      showSnackBar(title: 'Fecha de nacimiento', message: 'Debe ser mayor de edad para continuar');
      return false;
    }

    return true;
  }

  bool validateSomatometriaScreen({required String factorActividad}) {
    if (factorActividad.isEmpty) {
      showSnackBar(message: 'Por favor, escoja su factor de actividad');
      return false;
    }
    return true;
  }

  bool validateSensacionQuestionScreen({
    required String? sensacionSelected,
    required String sensacionOtro,
  }) {
    if (sensacionSelected == null && sensacionOtro.isEmpty) {
      showSnackBar(title: 'Respuesta requerida', message: 'Por favor, escoja una opción');
      return false;
    }
    return true;
  }

  bool validateVisionQuestionScreen({required String? visionSelected}) {
    if (visionSelected == null) {
      showSnackBar(title: 'Respuesta requerida', message: 'Por favor, escoja una opción');
      return false;
    }
    return true;
  }

  bool validateFichaMedicaScreen({
    required String tipoDiabetes,
    required String tiempoConDiabetes,
  }) {
    if (tipoDiabetes.isEmpty) {
      showSnackBar(message: 'Por favor, escoja su tipo de diabetes');
      return false;
    }

    if (tiempoConDiabetes.isEmpty) {
      showSnackBar(message: 'Por favor, escoja su tiempo con diabetes');
      return false;
    }

    return true;
  }

  bool validateTratamientoScreen({
    required List<Tratamiento> tratamientosSeleccionados,
    required bool isNingunTratamientoSelected,
  }) {
    if (tratamientosSeleccionados.isEmpty && !isNingunTratamientoSelected) {
      showSnackBar(message: 'Por favor, escoja su tratamiento');
      return false;
    }
    return true;
  }

  bool validateDoctorScreen({required String claveDoctor}) {
    if (claveDoctor.isEmpty) {
      showSnackBar(message: 'Por favor, ingrese la clave de su doctor');
      return false;
    }
    return true;
  }
}
