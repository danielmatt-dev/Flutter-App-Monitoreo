import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/cubit/auth_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_title_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// <>
class ResetPasswordScreen extends StatefulWidget {

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();

}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final authCubit = sl<AuthCubit>();
  final _correoController = TextEditingController();
  bool isCorreoInvalid = true;

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;
    Color backgroundColor = colorScheme.primary;

    return SafeArea(
      child: Scaffold(
        appBar: const AppBarCustom(
          title: 'Reset',
          center: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {},
                builder: (context, state) {
      
                  isCorreoInvalid = state.email.invalid;
      
                  return TextFieldTitleCustom(
                    labelText: 'Ingrese su correo',
                    controller: _correoController,
                    onChanged: (value) => authCubit.emailValid(value),
                    isInvalid: isCorreoInvalid,
                    errorText: 'No válido',
                    hintText: '',
                  );
                }
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
              ElevatedButton(
                onPressed: () {
                  if(_correoController.text.isEmpty){
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      CustomSnackbar.show(
                          context: context,
                          typeMessage: TypeMessage.warning,
                          title: 'Campo necesario',
                          description: 'El correo no puede estar vacío'
                      );
                    });
                    return;
                  }

                  authCubit.validarCorreoResetPassword(_correoController.text);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: colorScheme.background,
                  backgroundColor: backgroundColor,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: BlocBuilder<AuthCubit, AuthState>(
                  bloc: authCubit,
                  builder: (context, state) {
                    if(state is LoginLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is NonValidateCorreo) {
                      setState(() {
                        backgroundColor = colorScheme.error;
                      });
                      return const SizedBox.shrink();
                    } else if (state is ValidateCorreoSuccess){
                      // Pasar a la screen de password
                      return SizedBox.shrink();
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppTextStyles.autoButtonStyle(
                              text: 'Validar',
                              color: colorScheme.onPrimary,
                              height: height
                          ),
                          const SizedBox(
                            width:10,
                          ),
                          Icon(
                              Icons.near_me,
                              color: colorScheme.onPrimary
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

}