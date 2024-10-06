import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class NoConnectionInternet extends StatelessWidget {

  const NoConnectionInternet({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.onPrimary,
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primary.withOpacity(0.2)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.wifi_off_outlined,
                      size: 130,
                      color: colorScheme.primary
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                AppTextStyles.autoTitleStyle(
                  text: 'Conexión no disponible',
                  color: colorScheme.primary,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                ),
                AppTextStyles.autoBodyStyle(
                  text: 'No se detecta ninguna conexión activa. Conéctate a una red y reinicia la aplicación para continuar',
                  color: colorScheme.primary,
                  maxLines: 10,
                  textAlign: TextAlign.center,
                  size: SizeIcon.size18,
                  vertical: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}