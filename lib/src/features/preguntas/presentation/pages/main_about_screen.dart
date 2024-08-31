import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/pages/questions_screen.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/widgets/container_option_widget.dart';
import 'package:app_plataforma/src/shared/pages/instructions_screen.dart';
import 'package:flutter/material.dart';

class MainAboutScreen extends StatefulWidget {

  const MainAboutScreen({super.key});

  @override
  State<MainAboutScreen> createState() => _MainAboutScreenState();
}

class _MainAboutScreenState extends State<MainAboutScreen> {

  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const InstructionsScreen(),
      const QuestionsScreen(),
    ];
    super.initState();
  }

  void _navigateToScreen(int position, BuildContext context){

    if(position >= screens.length) return;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => screens[position]
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarCustom(
          title:  'Acerca De',
          center: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1,
            children: [
              ContainerOptionWidget(
                icon: Icons.menu_book_rounded,
                title: 'Instrucciones',
                onTap: () => _navigateToScreen(0, context),
              ),
              ContainerOptionWidget(
                icon: Icons.question_answer_rounded,
                title: 'Preguntas',
                onTap: () => _navigateToScreen(1, context),
              ),
              ContainerOptionWidget(
                icon: Icons.info_rounded,
                title: 'Acerca De',
                onTap: () => _navigateToScreen(2, context),
              ),
              ContainerOptionWidget(
                icon: Icons.contact_support_rounded,
                title: 'Soporte',
                onTap: () => _navigateToScreen(3, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}