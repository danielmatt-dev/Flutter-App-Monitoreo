import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/direccion/presentation/widgets/text_field_custom.dart';
import 'package:app_plataforma/src/features/paciente/presentation/cubit/auth_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/bloc/password_bloc.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/widgets/text_field_password.dart';
import 'package:app_plataforma/src/features/valor_pdf/presentation/widgets/icon_button_custom.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// <>
class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  late AuthCubit authCubit = sl<AuthCubit>();
  late PasswordBloc passwordBloc = sl<PasswordBloc>();

  final TextEditingController _correoController = TextEditingController();
  bool _obscurePassword = true;
  bool _isFormValid = false;

  void _checkFormValidity(AuthState authState, PasswordFormState passwordState) {
    final isFormValid = authState.email.valid && passwordState.currentPassword.valid;
    if (isFormValid != _isFormValid) {
      setState(() {
        _isFormValid = isFormValid;
      });
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextStyles.autoTitleStyle(
                  text: 'Inicio de Sesión',
                  color: colorScheme.onBackground,
                  height: height
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
              BlocConsumer<AuthCubit, AuthState>(
                bloc: authCubit,
                listener: (context, state) {
                  _checkFormValidity(state, passwordBloc.state);
                },
                builder: (context, state) {
                  return TextFieldCustom(
                    controller: _correoController,
                    labelText: 'Correo',
                    isInvalid: state.email.invalid,
                    errorText: 'Ingresa un correo válido',
                    onChanged: (value) => authCubit.emailChanged(value),
                  );
                },
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
              BlocConsumer<PasswordBloc, PasswordFormState>(
                listener: (context, state){
                  _checkFormValidity(authCubit.state, state);
                },
                builder: (context, state) {
                  return TextFieldPassword(
                      onChanged: (value) => passwordBloc.add(CurrentPasswordChanged(value)),
                      labelText: 'Contraseña',
                      isInvalid: state.currentPassword.invalid,
                      errorText: 'Mínimo 8 caracteres\nAl menos una letra\nAl menos un número',
                      toggleVisibility: _togglePasswordVisibility,
                      obscureText: _obscurePassword
                  );
                },
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
              IconButtonCustom(
                onPressed: _isFormValid
                    ? () {
                  FocusScope.of(context).unfocus(); // Ocultar el teclado
                  // authCubit.loginPaciente();
              } : null,
                text: 'COMENZAR',
                color: colorScheme.primary,
                horizontal: 80,
                icon: Icons.login,
            ),
              TextButton(
                onPressed: () {
                  // Navegar a la pantalla de "Olvidó su contraseña"
                },
                child: AppTextStyles.autoBodyStyle(
                    text: 'Olvidó su contraseña',
                    color: colorScheme.onBackground,
                    height: height
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la pantalla de "Crear cuenta"
                },
                child: AppTextStyles.autoBodyStyle(
                    text: 'Crear cuenta',
                    color: colorScheme.onBackground,
                    height: height
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
