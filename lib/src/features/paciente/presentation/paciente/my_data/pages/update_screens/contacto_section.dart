import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:flutter/material.dart';

class ContactoSection extends StatelessWidget {

  final TextEditingController nombreController;
  final TextEditingController apellidoPaternoController;
  final TextEditingController apellidoMaternoController;
  final TextEditingController telefonoController;
  final TextEditingController? correoController;

  const ContactoSection({
    super.key,
    required this.nombreController,
    required this.apellidoPaternoController,
    required this.apellidoMaternoController,
    required this.telefonoController,
    this.correoController
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return InfoSection(
      title: 'Contacto',
      children: [
        FastTextFieldTitleCustom(
          controller: nombreController,
          labelText: 'Nombre',
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
        FastTextFieldTitleCustom(
          controller: apellidoPaternoController,
          labelText: 'Apellido Paterno',
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
        FastTextFieldTitleCustom(
          controller: apellidoMaternoController,
          labelText: 'Apellido Materno',
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
        FastTextFieldTitleCustom(
          controller: telefonoController,
          labelText: 'Teléfono',
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
        if(correoController != null)
          FastTextFieldTitleCustom(
            controller: correoController!,
            labelText: 'Correo',
          ),
      ],

    );
  }

}