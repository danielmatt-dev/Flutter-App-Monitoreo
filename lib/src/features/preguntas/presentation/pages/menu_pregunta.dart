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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0377A7),
              Color(0xFF58A6DC),
            ],
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
              Container(
                width: height * 0.2,
                height: height * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Center(
                  child: Icon(
                    Icons.fact_check_outlined,
                    size: height * 0.1,
                    color: Colors.white,
                    weight: 0.1,
                  ),
                ),
              ),
              const Spacer(flex: 1),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
              AppTextStyles.autoTitleStyle(
                text: 'Responde a la Encuesta',
                color: colorScheme.onPrimary,
                height: height,
                maxLines: 2,
              ),
              AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
              AppTextStyles.autoBodyStyle(
                text: 'Por favor, responda con sinceridad para ayudar a identificar mejor sus necesidades.',
                color: colorScheme.onPrimary,
                height: height,
                maxLines: 10,
                textAlign: TextAlign.center
              ),
              const Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PreguntaScreen()),
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
                    height: height,
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}