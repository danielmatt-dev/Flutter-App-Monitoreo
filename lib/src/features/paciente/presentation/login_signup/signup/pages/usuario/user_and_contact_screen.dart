import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/info_section.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/contacto_section.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_password.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAndContactScreen extends StatefulWidget {

  final TextEditingController nombreController;
  final TextEditingController apellidoPaternoController;
  final TextEditingController apellidoMaternoController;
  final TextEditingController telefonoController;
  final TextEditingController correoController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const UserAndContactScreen({
    super.key,
    required this.nombreController,
    required this.apellidoPaternoController,
    required this.apellidoMaternoController,
    required this.telefonoController,
    required this.correoController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  State<UserAndContactScreen> createState() => _UserAndContactScreenState();

}

class _UserAndContactScreenState extends State<UserAndContactScreen> with AutomaticKeepAliveClientMixin<UserAndContactScreen> {

  final pacienteBloc = sl<PacienteBloc>();
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
  void initState() {
    pacienteBloc.add(const InitializeFormEvent(FormType.both));
    super.initState();
  }

  @override
  void dispose() {
    widget.nombreController.dispose();
    widget.apellidoPaternoController.dispose();
    widget.apellidoMaternoController.dispose();
    widget.telefonoController.dispose();
    widget.correoController.dispose();
    widget.passwordController.dispose();
    widget.confirmPasswordController.dispose();
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

        if (state is CombinedFormState) {
          isCorreoInvalid = state.usuarioFormState.correo.invalid;
          isPasswordInvalid = state.usuarioFormState.newPassword.invalid;
          isConfirmPasswordInvalid = state.usuarioFormState.confirmPassword.invalid;
        }

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              InfoSection(
                title: 'Usuario',
                children: [
                  TextFieldTitleCustom(
                    controller: widget.correoController,
                    labelText: 'Correo',
                    hintText: 'ejemplo@correo.com',
                    onChanged: (value) => pacienteBloc.add(UsuarioCorreoChanged(value)),
                    isInvalid: isCorreoInvalid,
                    errorText: isCorreoInvalid ? 'Correo no válido' : '',
                    maxLenght: 70,
                    inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                  ),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                  FastTextFieldPassword(
                    onChanged: (value) => pacienteBloc.add(UsuarioPasswordChanged(value)),
                    labelText: 'Contraseña',
                    isInvalid: isPasswordInvalid,
                    hintText: 'Mínimo 8 caracteres',
                    errorText: isPasswordInvalid ? 'Al menos una letra mayúscula\nAl menos una letra minúscula\nAl menos un número' : '',
                    toggleVisibility: _toggleNewPasswordVisibility,
                    obscureText: _obscureNewPassword,
                  ),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                  FastTextFieldPassword(
                    onChanged: (value) => pacienteBloc.add(UsuarioConfirmPasswordChanged(value)),
                    labelText: 'Confirmar contraseña',
                    isInvalid: isConfirmPasswordInvalid,
                    hintText: 'Repita su contraseña',
                    errorText: 'Las contraseñas no coinciden',
                    toggleVisibility: _toggleConfirmPasswordVisibility,
                    obscureText: _obscureConfirmPassword,
                  ),
                ],
              ),
              ContactoSection(
                nombreController: widget.nombreController,
                apellidoPaternoController: widget.apellidoPaternoController,
                apellidoMaternoController: widget.apellidoMaternoController,
                telefonoController: widget.telefonoController,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
