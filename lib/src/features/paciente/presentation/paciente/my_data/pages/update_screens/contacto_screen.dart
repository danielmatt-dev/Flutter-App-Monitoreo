import 'package:app_plataforma/src/core/styles/app_button_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/contacto_section.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactoScreen extends StatefulWidget {

  final Map<String, String> map;

  const ContactoScreen({super.key, required this.map});

  @override
  State<ContactoScreen> createState() => _ContactoScreenState();
}

class _ContactoScreenState extends State<ContactoScreen> {

  final pacienteBloc = sl<PacienteBloc>();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPaternoController = TextEditingController();
  final TextEditingController _apellidoMaternoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();

  void inicializarEventos(){

    pacienteBloc.add(const InitializeFormEvent(FormType.contact));

    pacienteBloc.add(ContactoNombreChanged(_nombreController.text));
    pacienteBloc.add(ContactoApellidoPaternoChanged(_apellidoPaternoController.text));
    pacienteBloc.add(ContactoApellidoMaternoChanged(_apellidoMaternoController.text));
    pacienteBloc.add(ContactoTelefonoChanged(_telefonoController.text));
    pacienteBloc.add(ContactoCorreoChanged(_correoController.text));

  }

  @override
  void initState() {
    _nombreController.text = widget.map['Nombre'] ?? '';
    _apellidoPaternoController.text = widget.map['Apellido paterno'] ?? '';
    _apellidoMaternoController.text = widget.map['Apellido materno'] ?? '';
    _telefonoController.text = widget.map['Teléfono'] ?? '';
    _correoController.text = widget.map['Correo'] ?? '';

    inicializarEventos();

    super.initState();
  }

  void _actualizarPaciente() {

    pacienteBloc.add(
      ActualizarPacienteEvent(
        nombre: _nombreController.text,
        apellidoPaterno: _apellidoPaternoController.text,
        apellidoMaterno: _apellidoMaternoController.text,
        fechaNacimiento: DateTime.parse(widget.map['Fecha de nacimiento'] ?? ''),
        genero: widget.map['Género'] ?? '',
        estadoCivil: widget.map['estadocivil'] ?? '',
        nivelEstudios: widget.map['Nivel de estudios'] ?? '',
        numMiembrosHogar: int.parse(widget.map['Miembros del hogar'] ?? '0'),
        tipoDiabetes: widget.map['Tipo de diabetes'] ?? '',
        tiempoDiabetes: widget.map['Tiempo con diabetes'] ?? '',
        peso: double.parse(widget.map['peso'] ?? '0.0'),
        talla: double.parse(widget.map['talla'] ?? '0.0'),
        factorActividad: widget.map['Factor de actividad'] ?? '',
        telefono: _telefonoController.text,
        correo: _correoController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.onPrimary,
        appBar: AppBar(
          backgroundColor: colorScheme.surface,
          elevation: 0,
          title: AppTextStyles.autoBodyStyle(
            text: 'Contacto',
            color: colorScheme.primary,
            height: height,
            percent: 0.03,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: AppButtonStyles.iconStyle(
              iconData: Icons.close,
              height: height,
              color: mapColor['Rojo'],
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _actualizarPaciente();
              },
              icon: AppButtonStyles.iconStyle(
                iconData: Icons.check,
                height: height,
                color: mapColor['Verde'],
              ),
            ),
          ],
        ),
        body: BlocConsumer<PacienteBloc, PacienteState>(
            listener: (context, state) {
              if (state is PacienteUpdateSuccess) {
                CustomSnackbar.show(
                    context: context,
                    typeMessage: TypeMessage.success,
                    title: 'Actualización exitosa',
                    description: 'Los datos se actualizaron correctamente'
                );
              } else if (state is PacienteError) {
                CustomSnackbar.show(
                  context: context,
                  typeMessage: TypeMessage.error,
                  title: 'Error',
                  description: 'Vuelva a intentarlo más tarde',
                );
              } else if(state is PacienteNonValidateUpdate){
                CustomSnackbar.show(
                    context: context,
                    typeMessage: TypeMessage.warning,
                    title: 'Correo ya registrado',
                    description: 'Por favor, usa un correo diferente.'
                );
                inicializarEventos();
              }
              },
            builder: (context, state) {
      
              bool isFormValid = false;
      
              if (state is CombinedFormState) {
                isFormValid = state.contactoFormState.isValid;
              } else if (state is ContactoFormState) {
                isFormValid = state.isValid;
              }
      
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
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
                          onPressed: isFormValid ? _actualizarPaciente : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mapColor['Verde'],
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: AppTextStyles.autoBodyStyle(
                            text: 'Actualizar',
                            color: colorScheme.onPrimary,
                            height: height,
                            percent: 0.03,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          ),
      ),
    );
  }
}