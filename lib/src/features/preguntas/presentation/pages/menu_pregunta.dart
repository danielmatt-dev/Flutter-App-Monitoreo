import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/pages/pregunta_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              AppTextStyles.autoTitleStyle(
                  text: 'Encuesta sobre el Autocuidado en Pacientes con Diabetes',
                  color: colorScheme.onPrimary,
                  height: height,
                  maxLines: 2
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02) ,
              AppTextStyles.autoBodyStyle(
                  text: 'Todos los datos son confidenciales, tenga la confianza de responder con sinceridad todas las preguntas, esto podrá identificar más claramente sus necesidades.',
                  color: colorScheme.onPrimary,
                  height: height,
                  maxLines: 10,
                  textAlign: TextAlign.center
              ),
              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PreguntaScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  child: AppTextStyles.autoBodyStyle(
                      text: 'Comenzar',
                      color: colorScheme.secondary,
                      height: height
                  )
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}