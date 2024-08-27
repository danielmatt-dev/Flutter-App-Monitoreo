import 'package:app_plataforma/src/features/paciente/presentation/login_signup/cubit/auth_cubit.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/login/pages/login_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:app_plataforma/src/shared/widgets/custom_snackbar.dart';
import 'package:app_plataforma/src/shared/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  final int length;
  final int currentPage;
  final PageController pageController;
  final List<bool Function(BuildContext context)> validations;
  final VoidCallback onSave;

  CustomBottomNavigationBar({
    super.key,
    required this.length,
    required this.currentPage,
    required this.pageController,
    required this.validations,
    required this.onSave
  });

  final authCubit = sl<AuthCubit>();

  bool isFormValid(PacienteState state) {
    //return true;
    if (state is CombinedFormState) {
      return state.isFormValid;
    }
    return false;
  }

  Future<bool> validateUserAndContactScreen(BuildContext context, PacienteState state) async {
    return true;

    if (!isFormValid(state)) {
      return false;
    }

    String correo = (state as CombinedFormState).usuarioFormState.correo.value;

    await authCubit.validarCorreo(correo);

    if (!context.mounted) return false;

    if (authCubit.state is NonValidateExitsCorreo) {
      CustomSnackbar.show(
          context: context,
          typeMessage: TypeMessage.warning,
          title: 'Correo ya registrado',
          description: 'Por favor, usa un correo diferente.'
      );
      return false;
    }

    return true;
  }

  Future<void> _onNextButtonPressed(BuildContext context, PacienteState state, PageController pageController) async {
    if (currentPage == 0) {
      bool formValid = await validateUserAndContactScreen(context, state);
      if (!formValid) return;
    } else if (!validations[currentPage](context)) {
      return;
    }

    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _onSaveButtonPressed(BuildContext context) {
    if (!validations[currentPage](context)) {
      return;
    }
    onSave();
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<PacienteBloc, PacienteState>(
      builder: (context, state) {
        return Container(
          color: colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationButton(
                  label: currentPage == 0 ? 'VOLVER' : 'ANTERIOR',
                  icon: Icons.arrow_back,
                  onPressed: currentPage != 0
                      ? () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                  : () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  enabledColor: colorScheme.background,
                  disabledColor: const Color(0xFFD9D9D9),
                  textColor: colorScheme.secondary,
                ),
                if (currentPage != length - 1)
                  NavigationButton(
                    label: 'SIGUIENTE',
                    icon: Icons.arrow_forward,
                    onPressed: () { _onNextButtonPressed(context, state, pageController); },
                    enabledColor: Colors.green,
                    disabledColor: const Color(0xFFD9D9D9),
                    textColor: colorScheme.background,
                  )
                else
                  NavigationButton(
                    label: 'GUARDAR',
                    icon: Icons.save,
                    onPressed: () => _onSaveButtonPressed(context),
                    enabledColor: Colors.green,
                    disabledColor: const Color(0xFFD9D9D9),
                    textColor: colorScheme.background,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}