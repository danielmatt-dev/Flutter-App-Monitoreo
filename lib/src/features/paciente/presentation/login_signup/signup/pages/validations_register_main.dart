import 'package:app_plataforma/src/features/tratamiento/domain/entities/tratamiento.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';

class ValidationsRegisterMain {

  final BuildContext context;

  ValidationsRegisterMain({required this.context});

  void showSnackBar({
    String title = MessagesSnackbar.requiredField,
    required String message,
    bool withMessage = true
  }) {
    message = withMessage ? MessagesSnackbar.getMessageSelectedData(message) : message;

    CustomSnackbar.show(
      context: context,
      typeMessage: TypeMessage.warning,
      title: title,
      description: message,
    );
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
      showSnackBar(message: 'su estado civil');
      return false;
    }

    if (estudios.isEmpty) {
      showSnackBar(message: 'su nivel de estudios');
      return false;
    }

    if (DateTime.parse(fechaNacimiento) == DateTime.now()) {
      showSnackBar(message: 'su fecha de nacimiento');
      return false;
    }

    if (!esMayorDeEdad(fechaNacimiento)) {
      showSnackBar(title: 'Fecha de nacimiento', message: 'Debe ser mayor de edad para continuar', withMessage: false);
      return false;
    }

    return true;
  }

  bool validateSomatometriaScreen({required String factorActividad}) {
    if (factorActividad.isEmpty) {
      showSnackBar(message: 'su factor de actividad');
      return false;
    }
    return true;
  }

  bool validateSensacionQuestionScreen({
    required String? sensacionSelected,
    required String sensacionOtro,
  }) {
    if (sensacionSelected == null && sensacionOtro.isEmpty) {
      showSnackBar(title: MessagesSnackbar.requiredResponse, message: 'una opción');
      return false;
    }
    return true;
  }

  bool validateVisionQuestionScreen({required String? visionSelected}) {
    if (visionSelected == null) {
      showSnackBar(title: MessagesSnackbar.requiredResponse, message: 'una opción');
      return false;
    }
    return true;
  }

  bool validateFichaMedicaScreen({
    required String tipoDiabetes,
    required String tiempoConDiabetes,
  }) {
    if (tipoDiabetes.isEmpty) {
      showSnackBar(message: 'su tipo de diabetes');
      return false;
    }

    if (tiempoConDiabetes.isEmpty) {
      showSnackBar(message: 'su tiempo con diabetes');
      return false;
    }

    return true;
  }

  bool validateTratamientoScreen({
    required List<Tratamiento> tratamientosSeleccionados,
    required bool isNingunTratamientoSelected,
  }) {
    if (tratamientosSeleccionados.isEmpty && !isNingunTratamientoSelected) {
      showSnackBar(message: 'su tratamiento');
      return false;
    }
    return true;
  }

  bool validateDoctorScreen({required String claveDoctor}) {
    if (claveDoctor.isEmpty) {
      showSnackBar(message: 'Por favor, ingrese la clave de su doctor', withMessage: false);
      return false;
    }
    return true;
  }
}
