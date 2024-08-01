import 'package:app_plataforma/src/features/paciente/presentation/paciente/bloc/paciente_bloc.dart';
import 'package:app_plataforma/src/shared/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  final int length;
  final int currentPage;
  final PageController pageController;
  final List<bool Function(BuildContext context)> validations;
  final VoidCallback onSave;

  const CustomBottomNavigationBar({
    super.key,
    required this.length,
    required this.currentPage,
    required this.pageController,
    required this.validations,
    required this.onSave
  });

  bool isFormValid(PacienteState state) {
    return true;
    if (state is CombinedFormState) {
      return state.isFormValid;
    }
    return false;
  }

  void _onNextButtonPressed(BuildContext context, PageController controller) {
    if (currentPage != 0 && !validations[currentPage](context)) {
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
        bool formValid = currentPage == 0 ? isFormValid(state) : true;

        return Container(
          color: colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationButton(
                  label: 'ANTERIOR',
                  icon: Icons.arrow_back,
                  onPressed: currentPage != 0
                      ? () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                      : null,
                  isValid: currentPage != 0,
                  enabledColor: colorScheme.background,
                  disabledColor: const Color(0xFFD9D9D9),
                  textColor: colorScheme.secondary,
                ),
                if (currentPage != length - 1)
                  NavigationButton(
                    label: 'SIGUIENTE',
                    icon: Icons.arrow_forward,
                    onPressed: formValid
                        ? () => _onNextButtonPressed(context, pageController)
                        : null,
                    isValid: formValid,
                    enabledColor: Colors.green,
                    disabledColor: const Color(0xFFD9D9D9),
                    textColor: colorScheme.background,
                  )
                else
                  NavigationButton(
                    label: 'GUARDAR',
                    icon: Icons.save,
                    onPressed: () => _onSaveButtonPressed(context),
                    isValid: formValid,
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