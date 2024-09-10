import 'package:app_plataforma/src/core/menu/menu_navigation_controller.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/cubit/auth_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/login/pages/reset_password_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/register_main.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/utils/messages_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_password.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:formz/formz.dart';

// <>
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    color: const Color(0xFF1c73ad),
                    height: height * 0.40,
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    color: colorScheme.primary,
                    height: height * 0.30,
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperOne(flip: true),
                  child: Container(
                    color: const Color(0xFF184f74),
                    height: height * 0.15,
                  ),
                ),
                const LoginBodyScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginBodyScreen extends StatefulWidget {
  const LoginBodyScreen({super.key});

  @override
  State<LoginBodyScreen> createState() => _LoginBodyScreenState();
}

class _LoginBodyScreenState extends State<LoginBodyScreen> {

  final authCubit = sl<AuthCubit>();
  final _correoController = TextEditingController();
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocConsumer<AuthCubit, AuthState>(
          bloc: authCubit,
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MenuNavigationController()),
              );
            } else if (state is BadCredentialsError) {
              CustomSnackbar.show(
                context:  context,
                typeMessage: TypeMessage.warning,
                title: MessagesSnackbar.warning,
                description: MessagesSnackbar.messageBadCredentials,
              );
            } else if (state is AuthError){
              CustomSnackbar.show(
                context:  context,
                typeMessage: TypeMessage.error,
                title: MessagesSnackbar.error,
                description: MessagesSnackbar.messageConnectionError,
              );
            }
            },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.12),
                AppTextStyles.autoTitleStyle(
                  text: 'Inicia sesión para continuar',
                  color: colorScheme.onPrimary,
                  height: height,
                  percent: 0.04,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.15),
                TextFieldTitleCustom(
                  controller: _correoController,
                  labelText: 'Correo',
                  hintText: 'ejemplo@correo.com',
                  prefixIcon: Icons.email_rounded,
                  isInvalid: state.email.invalid,
                  onChanged: (value) => authCubit.emailChanged(value),
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                FastTextFieldPassword(
                  labelText: 'Contraseña',
                  hintText: 'Ingresa tu contraseña',
                  onChanged: (value) => authCubit.passwordChanged(value),
                  isInvalid: state.password.invalid,
                  errorText: 'Mínimo 8 caracteres\nAl menos una letra minúscula\nAl menos una letra mayúscula\nAl menos un número',
                  toggleVisibility: _togglePasswordVisibility,
                  obscureText: _obscurePassword,
                  prefixIcon: Icons.lock_rounded,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPasswordScreen()
                          )
                      );
                    },
                    child: AppTextStyles.autoBodyStyle(
                        text: 'Restablecer contraseña',
                        color: colorScheme.primary,
                        height: height,
                        textAlign: TextAlign.right,
                        percent: 0.02
                    ),
                  ),
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainRegister()));
                      },
                      child: AppTextStyles.autoButtonStyle(
                        text: 'Crear cuenta',
                        color: colorScheme.primary,
                        height: height,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: state.status.isValidated ? () => authCubit.loginPaciente() : null,
                      backgroundColor: state.status.isValidated ? colorScheme.primary : Colors.grey,
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ],
            );
          }
          )
    );
  }
}