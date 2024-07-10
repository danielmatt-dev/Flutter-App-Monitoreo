import 'package:app_plataforma/src/core/menu/menu_navigation_controller.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/direccion/presentation/widgets/text_field_custom.dart';
import 'package:app_plataforma/src/features/paciente/presentation/cubit/auth_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/password/widgets/text_field_password.dart';
import 'package:app_plataforma/src/features/paciente/presentation/signup/pages/datos_dos.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
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

  final TextEditingController _correoController = TextEditingController();
  bool _obscurePassword = true;

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.secondary,
              colorScheme.background,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: colorScheme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextStyles.autoTitleStyle(
                          text: 'Inicio de Sesión',
                          color: colorScheme.onBackground,
                          height: height,
                        ),
                        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                        BlocConsumer<AuthCubit, AuthState>(
                          bloc: authCubit,
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const MenuNavigationController()),
                              );
                            } else if (state is LoginError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Error al iniciar sesión')),
                              );
                            }
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                TextFieldCustom(
                                  controller: _correoController,
                                  labelText: 'Correo',
                                  isInvalid: state.email.invalid,
                                  errorText: 'Ingresa un correo válido',
                                  onChanged: (value) {
                                    authCubit.emailChanged(value);
                                  },
                                ),
                                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                                TextFieldPassword(
                                  onChanged: (value) {
                                    authCubit.passwordChanged(value);
                                  },
                                  labelText: 'Contraseña',
                                  isInvalid: state.password.invalid,
                                  errorText: 'Mínimo 8 caracteres\nAl menos una letra\nAl menos un número',
                                  toggleVisibility: _togglePasswordVisibility,
                                  obscureText: _obscurePassword,
                                ),
                              ],
                            );
                          },
                        ),
                        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                        BlocBuilder<AuthCubit, AuthState>(
                          bloc: authCubit,
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state.status.isValidated
                                  ? () {
                                FocusScope.of(context).unfocus(); // Ocultar el teclado
                                authCubit.loginPaciente();
                              }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.onBackground,
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: AppTextStyles.autoBodyStyle(
                                text: 'COMENZAR',
                                color: Colors.white,
                                height: height,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navegar a la pantalla de "Olvidó su contraseña"
                    },
                    child: AppTextStyles.autoBodyStyle(
                      text: 'Olvidó su contraseña',
                      color: colorScheme.primary,
                      height: height,
                      percent: 0.03
                    ),
                  ),
                ),
                AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const DatosDos()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: colorScheme.primary),
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: AppTextStyles.autoBodyStyle(
                    text: 'CREAR CUENTA',
                    color: colorScheme.primary,
                    height: height,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
