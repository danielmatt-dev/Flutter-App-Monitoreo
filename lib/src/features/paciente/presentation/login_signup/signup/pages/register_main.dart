import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_sheet_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/user_and_contact_screen.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/widgets/step_progress_widget.dart';
import 'package:flutter/material.dart';

class MainRegister extends StatefulWidget {

  const MainRegister({super.key});

  @override
  State<MainRegister> createState() => _MainRegisterState();

}

class _MainRegisterState extends State<MainRegister> {
  int _currentPage = 0;

  List<String> titles = [
    'Usuario',
    'Ficha Técnica',
    'Health Information',
    'Additional Info 1',
    'Additional Info 2',
    'Additional Info 3',
    'Additional Info 4',
    'Additional Info 5',
    'Additional Info 6',
    'Additional Info 7',
  ];

  List<Widget> screens = [
    const UserAndContactScreen(),
    const DataSheetScreen()
  ];

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const AppBarCustom(
        title: 'Alta de paciente'
      ),
      body: Column(
        children: [
          StepProgressWidget(
            currentStep: _currentPage,
            totalSteps: screens.length,
            titles: titles,
          ),
          Expanded(
            child: Container(
              color: brightness == Brightness.light ? Colors.white.withOpacity(0.7) : Colors.black38,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                  child: screens[_currentPage]
              ),
            ),
          ),
        ],
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
                  setState(() {
                    _currentPage--;
                  });
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
                  backgroundColor: colorScheme.background,
                  side: BorderSide(color: colorScheme.secondary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (_currentPage != titles.length - 1)
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _currentPage++;
                    });
                  },
                  icon: AppTextStyles.autoBodyStyle(
                    text: 'SIGUIENTE',
                    color: colorScheme.background,
                    height: height,
                    percent: 0.02,
                  ),
                  label: Icon(Icons.arrow_forward, color: colorScheme.background),
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