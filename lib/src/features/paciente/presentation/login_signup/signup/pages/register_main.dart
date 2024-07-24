import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/ficha_medica/tratamiento_question.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/signup_screens.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/step_progress_widget.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/ficha_medica_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/paciente/my_data/pages/update_screens/ficha_medica_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainRegister extends StatefulWidget {
  const MainRegister({super.key});

  @override
  State<MainRegister> createState() => _MainRegisterState();
}

class _MainRegisterState extends State<MainRegister> {

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPaternoController = TextEditingController();
  final TextEditingController _apellidoMaternoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final TextEditingController _nacimientoController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _numMiembrosController = TextEditingController();
  final TextEditingController _estadoCivilController = TextEditingController();
  final TextEditingController _estudiosController = TextEditingController();

  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _tallaController = TextEditingController();
  final TextEditingController _factorController = TextEditingController();

  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _tiempoController = TextEditingController();

  List<Widget> screens = [];

  int _currentPage = 0;
  final PageController _pageController = PageController();

  List<String> titles = [
    'Usuario',
    'Ficha Técnica',
    'Somatometría',
    'Somatometría',
    'Somatometría',
    'Ficha Médica',
    'Ficha Médica',
  ];

  List<Widget> questions = [
    SensacionQuestion(
        question: 'Pregunta 1',
        additionalOptions: ['Manos', 'Pies', 'Piernas'],
        onOptionSelected: (value) {},
        onAdditionalOptionSelected: (value){}
    ),
    TemplateQuestion(
        question: 'Pregunta 2',
        answers: ['Manos', 'Pies', 'Piernas'],
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
  void initState() {

    screens = [
      UserAndContactScreen(
          nombreController: _nombreController,
          apellidoPaternoController: _apellidoPaternoController,
          apellidoMaternoController: _apellidoMaternoController,
          telefonoController: _telefonoController,
          correoController: _correoController,
          passwordController: _passwordController,
          confirmPasswordController: _confirmPasswordController
      ),
      DataSheetScreen(
          nacimientoController: _nacimientoController,
          generoController: _generoController,
          numMiembrosController: _numMiembrosController,
          estadoCivilController: _estadoCivilController,
          estudiosController: _estudiosController
      ),
      SomatometriaScreen(
          pesoController: _pesoController,
          tallaController: _tallaController,
          factorController: _factorController
      ),
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FichaMedicaSection(
          tiempoController: _tiempoController,
          tipoController: _tipoController,
        ),
      ),

    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    final background = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black38;

    List<Widget> allScreens = [...screens, ...questions];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StepProgressWidget(
              currentStep: _currentPage,
              totalSteps: allScreens.length,
              titles: titles,
              background: colorScheme.surface,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: allScreens,
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

                    print('Nombre: ${_nombreController.text}');
                    print('Apellido Paterno: ${_apellidoPaternoController.text}');
                    print('Apellido Materno: ${_apellidoMaternoController.text}');
                    print('Teléfono: ${_telefonoController.text}');
                    print('Correo: ${_correoController.text}');
                    print('Password: ${_passwordController.text}');
                    print('Confirm Password: ${_confirmPasswordController.text}');
                    print('Fecha de Nacimiento: ${_nacimientoController.text}');
                    print('Género: ${_generoController.text}');
                    print('Miembros del Hogar: ${_numMiembrosController.text}');
                    print('Estado Civil: ${_estadoCivilController.text}');
                    print('Estudios: ${_estudiosController.text}');
                    print('Peso: ${_pesoController.text}');
                    print('Talla: ${_tallaController.text}');
                    print('Factor de Actividad: ${_factorController.text}');
                    print('Tipo de Diabetes: ${_tipoController.text}');
                    print('Tiempo con Diabetes: ${_tiempoController.text}');

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
