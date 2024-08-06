import 'package:app_plataforma/src/core/menu/screens.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/bloc/password_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/widgets/text_field_password.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_password.dart';
import 'package:app_plataforma/src/shared/widgets/icon_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class UpdatePasswordScreen extends StatefulWidget {

  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final PasswordBloc passwordBloc = sl<PasswordBloc>();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  void _toggleCurrentPasswordVisibility() {
    setState(() {
      _obscureCurrentPassword = !_obscureCurrentPassword;
    });
  }

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
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const AppBarCustom(
        title: 'Cambiar contraseña',
        center: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocConsumer<PasswordBloc, PasswordFormState>(
                listener: (context, state) {
                  if (state.status.isSubmissionSuccess) {
                    CustomSnackbar.show(
                        context: context,
                        typeMessage: TypeMessage.success,
                        title: 'Actualización exitosa',
                        description: 'La contraseña se actualizó correctamente'
                    );
                    Future.delayed(Duration.zero, () {
                      passwordBloc.add(ResetPasswordForm());
                    });
                  }
                  if(state.status.isSubmissionFailure) {
                    CustomSnackbar.show(
                        context: context,
                        typeMessage: TypeMessage.error,
                        title: 'Contraseña antigua incorrecta',
                        description: 'Verifique e intente de nuevo'
                    );
                  }
                  if(state.status.isSubmissionCanceled){
                    CustomSnackbar.show(
                      context:  context,
                      typeMessage: TypeMessage.error,
                      title: 'Error',
                      description: 'Vuelva a intentarlo más tarde',
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      FastTextFieldPassword(
                        onChanged: (value) => passwordBloc.add(CurrentPasswordChanged(value)),
                        labelText: 'Contraseña antigua',
                        isInvalid: state.currentPassword.invalid,
                        errorText: 'Por favor, introduce tu contraseña.',
                        toggleVisibility: _toggleCurrentPasswordVisibility,
                        obscureText: _obscureCurrentPassword,
                      ),
                      AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                      FastTextFieldPassword(
                        onChanged: (value) => passwordBloc.add(NewPasswordChanged(value)),
                        labelText: 'Contraseña nueva',
                        isInvalid: state.newPassword.invalid,
                        errorText: 'Mínimo 8 caracteres\nAl menos una letra minúscula\nAl menos una letra mayúscula\nAl menos un número',
                        toggleVisibility: _toggleNewPasswordVisibility,
                        obscureText: _obscureNewPassword,
                      ),
                      AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                      FastTextFieldPassword(
                        onChanged: (value) => passwordBloc.add(ConfirmPasswordChanged(value)),
                        labelText: 'Confirmar contraseña',
                        isInvalid: state.confirmPassword.invalid,
                        errorText: 'Las contraseñas no coinciden',
                        toggleVisibility: _toggleConfirmPasswordVisibility,
                        obscureText: _obscureConfirmPassword,
                      ),
                      AppSizeBoxStyle.sizeBox(height: height, percentage: 0.05),
                      IconButtonCustom(
                        onPressed: state.status.isValid
                            ? () {
                          FocusScope.of(context).unfocus();
                          passwordBloc.add(const PasswordFormSubmitted());
                        } : null,
                        text: 'Actualizar',
                        color: colorScheme.primary,
                        icon: Icons.lock_reset_rounded,
                        horizontal: 0,
                      ),
                      AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
