import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/contacto_section.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_password.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class UserAndContactScreen extends StatefulWidget {

  final TextEditingController nombreController;
  final TextEditingController apellidoPaternoController;
  final TextEditingController apellidoMaternoController;
  final TextEditingController telefonoController;
  final TextEditingController correoController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final ValueChanged<String>? onNombreChanged;

  const UserAndContactScreen({
    super.key,
    required this.nombreController,
    required this.apellidoPaternoController,
    required this.apellidoMaternoController,
    required this.telefonoController,
    required this.correoController,
    required this.passwordController,
    required this.confirmPasswordController,
    this.onNombreChanged
  });

  @override
  State<UserAndContactScreen> createState() => _UserAndContactScreenState();
}

class _UserAndContactScreenState extends State<UserAndContactScreen> with AutomaticKeepAliveClientMixin<UserAndContactScreen> {

  PacienteBloc pacienteBloc = sl<PacienteBloc>();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  void _toggleNewPasswordVisibility() {
    setState(() {
      _obscureNewPassword = !_obscureNewPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  void dispose() {
    widget.nombreController.dispose();
    widget.apellidoPaternoController.dispose();
    widget.apellidoMaternoController.dispose();
    widget.telefonoController.dispose();
    widget.correoController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<PacienteBloc, PacienteState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cuenta creada exitosamente')));
          } else if (state is PacienteError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {

          bool isCorreoInvalid = false;
          bool isPasswordInvalid = false;
          bool isConfirmPasswordInvalid = false;

          if (state is UsuarioFormState) {
            print('Aqui andamos brother');
            isCorreoInvalid = state.correo.invalid && state.status.isSubmissionFailure;
            isPasswordInvalid = state.newPassword.invalid && state.status.isSubmissionFailure;
            isConfirmPasswordInvalid = state.confirmPassword.invalid && state.status.isSubmissionFailure;
          }

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                InfoSection(
                  title: 'Usuario',
                  children: [
                    FastTextFieldTitleCustom(
                      controller: widget.correoController,
                      labelText: 'Correo',
                      hintText: 'correo@example.com',
                      onChanged: widget.onNombreChanged,
                      isInvalid: isCorreoInvalid,
                      errorText: isCorreoInvalid ? 'Correo no válido' : '',
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    FastTextFieldPassword(
                      onChanged: (value) => pacienteBloc.add(UsuarioPasswordChanged(value)),
                      labelText: 'Contraseña',
                      isInvalid: isPasswordInvalid,
                      errorText: isPasswordInvalid ? 'Mínimo 8 caracteres\nAl menos una letra\nAl menos un número' : '',
                      toggleVisibility: _toggleNewPasswordVisibility,
                      obscureText: _obscureNewPassword,
                    ),
                    AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    FastTextFieldPassword(
                      onChanged: (value) => pacienteBloc.add(UsuarioConfirmPasswordChanged(value)),
                      labelText: 'Confirmar contraseña',
                      isInvalid: isConfirmPasswordInvalid,
                      errorText: isConfirmPasswordInvalid ? 'La contraseña nueva no coincide con la contraseña confirmada.' : '',
                      toggleVisibility: _toggleConfirmPasswordVisibility,
                      obscureText: _obscureConfirmPassword,
                    ),
                  ],
                ),
                ContactoSection(
                  nombreController: widget.nombreController,
                  apellidoPaternoController: widget.apellidoPaternoController,
                  apellidoMaternoController: widget.apellidoMaternoController,
                  telefonoController: widget.telefonoController
                )
              ],
            ),
          );
        }
    );
  }

  @override
  bool get wantKeepAlive => true;

}