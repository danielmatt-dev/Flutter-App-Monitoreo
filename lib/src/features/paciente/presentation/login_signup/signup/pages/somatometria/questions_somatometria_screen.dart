import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/data_options.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/ficha_medica/tratamiento_question.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/somatometria/sensacion_question.dart';
import 'package:app_plataforma/src/features/paciente/presentation/login_signup/signup/pages/somatometria/vision_question.dart';
import 'package:app_plataforma/src/features/registro_respuestas/domain/entities/registro_respuestas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// <>
class QuestionsSomatometriaScreen extends StatefulWidget {

  const QuestionsSomatometriaScreen({super.key});

  @override
  State<QuestionsSomatometriaScreen> createState() => _QuestionsSomatometriaScreenState();
}

class _QuestionsSomatometriaScreenState extends State<QuestionsSomatometriaScreen> {

  int _selecteIndex = 0;

  final _screens = [

  ];

  final PageController _pageController = PageController();
  final Map<int, RegistroRespuestas> answers = {};

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _screens.length,
              onPageChanged: (index) {
                setState(() {
                  _selecteIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: _screens[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}

// <>
