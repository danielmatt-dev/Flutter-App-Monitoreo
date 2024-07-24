import 'package:app_plataforma/src/core/styles/app_button_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/contacto_section.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';

class ContactoScreen extends StatefulWidget {

  final Map<String, String> map;

  const ContactoScreen({super.key, required this.map});

  @override
  State<ContactoScreen> createState() => _ContactoScreenState();
}

class _ContactoScreenState extends State<ContactoScreen> {

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPaternoController = TextEditingController();
  final TextEditingController _apellidoMaternoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();

  @override
  void initState() {
    _nombreController.text = widget.map['Nombre'] ?? '';
    _apellidoPaternoController.text = widget.map['Apellido paterno'] ?? '';
    _apellidoMaternoController.text = widget.map['Apellido materno'] ?? '';
    _telefonoController.text = widget.map['Teléfono'] ?? '';
    _correoController.text = widget.map['Correo'] ?? '';

    super.initState();
  }

  void _actualizarPaciente() {

    final pacienteBloc = sl<PacienteBloc>();

    pacienteBloc.add(
        ActualizarPacienteEvent(
            nombre: _nombreController.text,
            apellidoPaterno: _apellidoPaternoController.text,
            apellidoMaterno: _apellidoMaternoController.text,
            fechaNacimiento: DateTime.parse(widget.map['Fecha de nacimiento'] ?? ''),
            genero: widget.map['Género'] ?? '',
            estadoCivil: widget.map['estadocivil'] ?? '',
            nivelEstudios: widget.map['Nivel de estudios'] ?? '',
            numMiembrosHogar: int.parse(widget.map['Teléfono'] ?? ''),
            tipoDiabetes: widget.map['Tipo de diabetes'] ?? '',
            tiempoDiabetes: widget.map['Tiempo con diabetes'] ?? '',
            peso: double.parse(widget.map['Peso'] ?? ''),
            talla: double.parse(widget.map['Talla'] ?? ''),
            factorActividad: widget.map['Teléfono'] ?? '',
            telefono: _telefonoController.text,
            correo: _correoController.text
      )
    );

  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        title: AppTextStyles.autoBodyStyle(
            text: 'Contacto',
            color: colorScheme.onBackground,
            height: height,
            percent: 0.03
        ),
        centerTitle: true,
        leading: IconButton(
          icon: AppButtonStyles.iconStyle(
              iconData: Icons.close,
              height: height,
              color: mapColor['Rojo']
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: AppButtonStyles.iconStyle(
                iconData: Icons.check,
                height: height,
                color: mapColor['Verde']
            ),)
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ContactoSection(
              nombreController: _nombreController,
              apellidoPaternoController: _apellidoPaternoController,
              apellidoMaternoController: _apellidoMaternoController,
              telefonoController: _telefonoController,
              correoController: _correoController,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _actualizarPaciente,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mapColor['Verde'],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: AppTextStyles.autoBodyStyle(
                    text: 'Actualizar',
                    color: colorScheme.background,
                    height: height,
                    percent: 0.03
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}