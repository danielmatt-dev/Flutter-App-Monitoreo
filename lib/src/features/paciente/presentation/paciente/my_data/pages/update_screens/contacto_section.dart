import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ContactoSection extends StatefulWidget {

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
  State<ContactoSection> createState() => _ContactoSectionState();
}

class _ContactoSectionState extends State<ContactoSection> {

  final pacienteBloc = sl<PacienteBloc>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<PacienteBloc, PacienteState>(
      listener: (context, state) {
        if (state is PacienteError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {

        bool isNombreInvalid = false;
        bool isApellidoPaternoInvalid = false;
        bool isApellidoMaternoInvalid = false;
        bool isTelefonoInvalid = false;
        bool isCorreoInvalid = false;

        if (state is ContactoFormState) {
          isNombreInvalid = state.nombre.invalid && state.status.isSubmissionFailure;
          isApellidoPaternoInvalid = state.apellidoPaterno.invalid && state.status.isSubmissionFailure;
          isApellidoMaternoInvalid = state.apellidoMaterno.invalid && state.status.isSubmissionFailure;
          isTelefonoInvalid = state.telefono.invalid && state.status.isSubmissionFailure;
          isCorreoInvalid = state.correo.invalid && state.status.isSubmissionFailure;
        }

        return InfoSection(
          title: 'Contacto',
          children: [
            FastTextFieldTitleCustom(
              controller: widget.nombreController,
              labelText: 'Nombre',
              onChanged: (value) {
                print('--------------------------------------------------------------------------------Nombre del form');
                return pacienteBloc.add(ContactoNombreChanged(value));
                }                ,
              isInvalid: isNombreInvalid,
              errorText: isNombreInvalid ? 'Nombre inválido' : '',
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
            FastTextFieldTitleCustom(
              controller: widget.apellidoPaternoController,
              labelText: 'Apellido Paterno',
              onChanged: (value) => pacienteBloc.add(ContactoApellidoPaternoChanged(value)),
              isInvalid: isApellidoPaternoInvalid,
              errorText: isApellidoPaternoInvalid ? 'Apellido Paterno inválido' : '',
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
            FastTextFieldTitleCustom(
              controller: widget.apellidoMaternoController,
              labelText: 'Apellido Materno',
              onChanged: (value) => pacienteBloc.add(ContactoApellidoMaternoChanged(value)),
              isInvalid: isApellidoMaternoInvalid,
              errorText: isApellidoMaternoInvalid ? 'Apellido Materno inválido' : '',
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
            FastTextFieldTitleCustom(
              controller: widget.telefonoController,
              labelText: 'Teléfono',
              onChanged: (value) => pacienteBloc.add(ContactoTelefonoChanged(value)),
              isInvalid: isTelefonoInvalid,
              errorText: isTelefonoInvalid ? 'Teléfono no válido' : '',
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
            if (widget.correoController != null)
              FastTextFieldTitleCustom(
                controller: widget.correoController!,
                labelText: 'Correo',
                onChanged: (value) => pacienteBloc.add(ContactoCorreoChanged(value)),
                isInvalid: isCorreoInvalid,
                errorText: isCorreoInvalid ? 'Correo no válido' : '',
              ),
          ],
        );
      },
    );
  }
}