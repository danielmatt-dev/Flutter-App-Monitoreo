import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/ficha_medica_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/widgets/template_appbar.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';

class FichaMedicaScreen extends StatefulWidget {

  final Map<String, String> map;

  const FichaMedicaScreen({
    super.key,
    required this.map
  });

  @override
  State<FichaMedicaScreen> createState() => _FichaMedicaScreenState();
}

class _FichaMedicaScreenState extends State<FichaMedicaScreen> {

  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _tiempoController = TextEditingController();

  @override
  void initState() {
    _tipoController.text = widget.map['Tipo de diabetes'] ?? '';
    _tiempoController.text = widget.map['Tiempo con diabetes'] ?? '';
    super.initState();
  }

  void _actualizarPaciente() {

    final pacienteBloc = sl<PacienteBloc>();

    pacienteBloc.add(
        ActualizarPacienteEvent(
          nombre: widget.map['Nombre'] ?? '',
          apellidoPaterno: widget.map['Apellido paterno'] ?? '',
          apellidoMaterno: widget.map['Apellido materno'] ?? '',
          fechaNacimiento: DateTime.parse(widget.map['Fecha de nacimiento'] ?? ''),
          genero: widget.map['Género'] ?? '',
          estadoCivil: widget.map['estadocivil'] ?? '',
          nivelEstudios: widget.map['Nivel de estudios'] ?? '',
          numMiembrosHogar: int.parse(widget.map['Miembros del hogar'] ?? '0'),
          tipoDiabetes: _tipoController.text,
          tiempoDiabetes: _tiempoController.text,
          peso: double.parse(widget.map['peso'] ?? '0.0'),
          talla: double.parse(widget.map['talla'] ?? '0.0'),
          factorActividad: widget.map['Factor de actividad'] ?? '',
          telefono: widget.map['Teléfono'] ?? '',
          correo: widget.map['Correo'] ?? '',
    ));

  }

  @override
  Widget build(BuildContext context) {

    return TemplateAppBar(
        title: 'Ficha Médica',
        onPressed: _actualizarPaciente,
        child: FichaMedicaSection(
          tiempoController: _tiempoController,
          tipoController: _tipoController,
        ),
      );
  }
}