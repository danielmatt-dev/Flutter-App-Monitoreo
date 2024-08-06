import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    this.correoController,
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

        if (state is CombinedFormState) {

          print('Forms combinadossss');

          isNombreInvalid = state.contactoFormState.nombre.invalid;
          isApellidoPaternoInvalid = state.contactoFormState.apellidoPaterno.invalid;
          isApellidoMaternoInvalid = state.contactoFormState.apellidoMaterno.invalid;
          isTelefonoInvalid = state.contactoFormState.telefono.invalid;
          isCorreoInvalid = state.contactoFormState.correo.invalid;
        }

        if(state is ContactoFormState) {

          print('Contactooooooooooo');

          isNombreInvalid = state.nombre.invalid;
          isApellidoPaternoInvalid = state.apellidoPaterno.invalid;
          isApellidoMaternoInvalid = state.apellidoMaterno.invalid;
          isTelefonoInvalid = state.telefono.invalid;
          isCorreoInvalid = state.correo.invalid;
        }

        return InfoSection(
          title: 'Contacto',
          children: [
            TextFieldTitleCustom(
              controller: widget.nombreController,
              labelText: 'Nombre',
              hintText: 'Juan',
              onChanged: (value) => pacienteBloc.add(ContactoNombreChanged(value)),
              isInvalid: isNombreInvalid,
              errorText: isNombreInvalid ? 'Nombre inválido' : '',
              typeKeyboard: TextInputType.text,
              maxLenght: 50,
              inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
            TextFieldTitleCustom(
              controller: widget.apellidoPaternoController,
              labelText: 'Apellido Paterno',
              hintText: 'García',
              onChanged: (value) => pacienteBloc.add(ContactoApellidoPaternoChanged(value)),
              isInvalid: isApellidoPaternoInvalid,
              errorText: isApellidoPaternoInvalid ? 'Apellido Paterno inválido' : '',
              typeKeyboard: TextInputType.text,
              maxLenght: 50,
              inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
            TextFieldTitleCustom(
              controller: widget.apellidoMaternoController,
              labelText: 'Apellido Materno',
              hintText: 'Pérez',
              onChanged: (value) => pacienteBloc.add(ContactoApellidoMaternoChanged(value)),
              isInvalid: isApellidoMaternoInvalid,
              errorText: isApellidoMaternoInvalid ? 'Apellido Materno inválido' : '',
              typeKeyboard: TextInputType.text,
              maxLenght: 50,
              inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
            TextFieldTitleCustom(
              controller: widget.telefonoController,
              labelText: 'Teléfono',
              hintText: '555-123-4567',
              onChanged: (value) => pacienteBloc.add(ContactoTelefonoChanged(value)),
              isInvalid: isTelefonoInvalid,
              errorText: isTelefonoInvalid ? 'Teléfono no válido' : '',
              typeKeyboard: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.singleLineFormatter
              ],
              maxLenght: 10,
            ),
            AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
            if (widget.correoController != null)
              TextFieldTitleCustom(
                controller: widget.correoController!,
                labelText: 'Correo',
                hintText: 'ejemplo@correo.com',
                onChanged: (value) => pacienteBloc.add(ContactoCorreoChanged(value)),
                isInvalid: isCorreoInvalid,
                errorText: isCorreoInvalid ? 'Correo no válido' : '',
                maxLenght: 70,
                inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
              ),
          ],
        );
      },
    );
  }
}