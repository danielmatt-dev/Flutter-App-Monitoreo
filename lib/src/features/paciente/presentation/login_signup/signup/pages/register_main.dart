import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/ficha_medica/tratamiento_question.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/ficha_tecnica/data_sheet_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/somatometria/sensacion_question.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/somatometria/somatometria_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/somatometria/vision_question.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/usuario/user_and_contact_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/step_progress_widget.dart';
import 'package:flutter/material.dart';

class MainRegister extends StatefulWidget {
  const MainRegister({super.key});

  @override
  State<MainRegister> createState() => _MainRegisterState();
}

class _MainRegisterState extends State<MainRegister> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  List<String> titles = [
    'Usuario',
    'Ficha Técnica',
    'Somatometría',
    'Somatometría',
    'Somatometría',
  ];

  List<Widget> screens = [
    const UserAndContactScreen(),
    const DataSheetScreen(),
    const SomatometriaScreen(),


  ];

  List<Widget> questions = [
    SensacionQuestion(
        question: 'Pregunta 1',
        additionalOptions: ['Manos', 'Pies', 'Piernas'],
        onOptionSelected: (value) {},
        onAdditionalOptionSelected: (value){}
    ),
    TemplateQuestion(
        question: '',
        answers: [],
        onSelectedResponse: (value) {}
    ),
    TemplateQuestion(
        question: 'Tipo de diabetes',
        answers: tipoOpciones,
        onSelectedResponse: (value) {}
    ),
    TemplateQuestion(
        question: 'Tiempo con diabetes',
        answers: tiempoOpciones,
        onSelectedResponse: (value) {}
    ),
    TratamientoQuestion(
        question: 'Seleccione su tratamiento',
        tratamientos: {'oral': ['tratamiento 1', 'tratamiento 2']},
        onChanged: (value){}
    ),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    final background = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black38;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StepProgressWidget(
              currentStep: _currentPage,
              totalSteps: screens.length,
              titles: titles,
              background: colorScheme.surface,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: screens,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: _currentPage != 0
                    ? () {
                  _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                }
                    : null,
                icon: Icon(
                  Icons.arrow_back,
                  color: colorScheme.secondary,
                ),
                label: AppTextStyles.autoBodyStyle(
                  text: 'ANTERIOR',
                  color: colorScheme.secondary,
                  height: height,
                  percent: 0.02,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: background,
                  side: BorderSide(color: colorScheme.secondary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (_currentPage != titles.length - 1)
                ElevatedButton.icon(
                  onPressed: () {
                    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                  },
                  icon: AppTextStyles.autoBodyStyle(
                    text: 'SIGUIENTE',
                    color: colorScheme.background,
                    height: height,
                    percent: 0.02,
                  ),
                  label: Icon(Icons.arrow_forward, color: background),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )
              else
                ElevatedButton(
                  onPressed: () {
                    // Handle the final submission here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: AppTextStyles.autoBodyStyle(
                    text: 'GUARDAR',
                    color: colorScheme.background,
                    height: height,
                    percent: 0.02,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
