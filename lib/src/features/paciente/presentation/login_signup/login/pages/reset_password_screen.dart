import 'dart:async';

import 'package:app_plataforma/src/core/menu/screens.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/cubit/auth_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_password.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget{

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();

}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final authCubit = sl<AuthCubit>();
  final _correoController = TextEditingController();
  final _newPasswordController = TextEditingController();

  bool _isButtonDisabled = false;
  Timer? disableTimer;

  bool isPasswordVisible = false;
  bool isCorreoInvalid = true;
  bool isPasswordInvalid = false;

  bool _obscureNewPassword = true;

  void _toggleNewPasswordVisibility() {
    setState(() {
      _obscureNewPassword = !_obscureNewPassword;
    });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    onPressedValidateCorreo() {

      if(_isButtonDisabled){
        return;
      }

      if (_correoController.text.isEmpty) {
        CustomSnackbar.show(
          context: context,
          typeMessage: TypeMessage.warning,
          title: MessagesSnackbar.requiredField,
          description: 'El correo no puede estar vacío',
        );
        return;
      }

      if (!isCorreoInvalid) {
        authCubit.validarCorreoResetPassword(_correoController.text);
      }

      setState(() {
        _isButtonDisabled = true;
      });

      disableTimer = Timer(const Duration(seconds: 5), () {
        setState(() {
          _isButtonDisabled = false;
        });
      });

    }

    onPressedValidatePassword () {

      if(_newPasswordController.text.isEmpty) {
        CustomSnackbar.show(
          context: context,
          typeMessage: TypeMessage.warning,
          title: MessagesSnackbar.requiredField,
          description: 'La contraseña no puede estar vacía',
        );
        return;
      }

      if (!isPasswordInvalid) {
        authCubit.resetPasswordEvent(_correoController.text, _newPasswordController.text);
      }

    }

    return Scaffold(
      appBar: const AppBarCustom(title: 'Reestablecer contraseña', size: SizeIcon.size22,),
      backgroundColor: colorScheme.onPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is ValidateCorreoSuccess) {
                setState(() {
                  isPasswordVisible = true;
                });
              } else if (state is NonValidateCorreo) {
                CustomSnackbar.show(
                    context: context,
                    typeMessage: TypeMessage.warning,
                    title: MessagesSnackbar.warning,
                    description: MessagesSnackbar.messageCorreoNonValidate
                );
                setState(() {
                  isCorreoInvalid = true;
                  isPasswordVisible = false;
                });
              } else if (state is ResetPasswordSuccess) {
                CustomSnackbar.show(
                    context: context,
                    typeMessage: TypeMessage.success,
                    title: MessagesSnackbar.success,
                    description: MessagesSnackbar.messageResetPasswordSuccess
                );
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              isCorreoInvalid = state.email.invalid;
              isPasswordInvalid = !state.password.valid;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldTitleCustom(
                    labelText: 'Ingrese su correo',
                    controller: _correoController,
                    onChanged: (value) => authCubit.emailValid(value),
                    isInvalid: isCorreoInvalid,
                    errorText: 'No válido',
                    hintText: 'ejemplo@correo.com',
                  ),
                  if(isPasswordVisible)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          FastTextFieldPassword(
                            labelText: 'Ingrese su nueva contraseña',
                            controller: _newPasswordController,
                            isInvalid: isPasswordInvalid,
                            hintText: 'Nueva contraseña',
                            onChanged: (value) => authCubit.passwordChanged(value),
                            errorText: 'Error',
                            toggleVisibility: _toggleNewPasswordVisibility,
                            obscureText: _obscureNewPassword,
                          ),
                        ]
                      ),
                    ),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                  ElevatedButton(
                      onPressed: isPasswordVisible
                          ? onPressedValidatePassword
                          : onPressedValidateCorreo,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppTextStyles.autoButtonStyle(
                            text: isPasswordVisible ? 'Restablecer' : 'Validar',
                            color: colorScheme.onPrimary
                          ),
                          const SizedBox(width: 10),
                          Icon(Icons.near_me, color: colorScheme.onPrimary),
                        ],
                      )
                  )
                ]
              );
            },
          ),
        ),
      ),
    );
  }

}