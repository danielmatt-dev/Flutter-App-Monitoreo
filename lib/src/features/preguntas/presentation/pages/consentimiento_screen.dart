import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/consentimiento_text.dart';
import 'package:flutter/material.dart';

class ConsentimientoScreen extends StatelessWidget {

  const ConsentimientoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
          backgroundColor: colorScheme.onPrimary,
          appBar: const AppBarCustom(
            title: 'Medicina Interna',
            center: true,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AppTextStyles.autoTitleStyle(
                      text: ConsentimientoText.titulo,
                      color: colorScheme.primary,
                      height: height,
                      maxLines: 5,
                      percent: 0.025
                  ),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.022),
                ...ConsentimientoText.getMapConsentimiento().entries.map((subtitulo) =>
                    ListTile(
                      title: AppTextStyles.autoBodyStyle(
                          text: '${subtitulo.key}:',
                          color: colorScheme.primary,
                          height: height,
                          maxLines: 5,
                          textAlign: TextAlign.left
                      ),
                      subtitle: AppTextStyles.autoBodyStyle(
                          text: subtitulo.value,
                          color: colorScheme.secondary,
                          height: height,
                          percent: 0.022,
                          maxLines: 20,
                          fontWeight: FontWeight.normal
                      ),
                      contentPadding: EdgeInsets.zero,
                    )),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.022),
                  AppTextStyles.autoBodyStyle(
                      text: ConsentimientoText.dudas,
                      color: colorScheme.primary,
                      height: height,
                      maxLines: 5,
                  ),
                  ...ConsentimientoText.getMapContacto().entries.map((subtitulo) =>
                      ListTile(
                        title: AppTextStyles.autoBodyStyle(
                            text: '${subtitulo.key}:',
                            color: colorScheme.primary,
                            height: height,
                            maxLines: 5,
                            textAlign: TextAlign.left
                        ),
                        subtitle: AppTextStyles.autoBodyStyle(
                            text: subtitulo.value,
                            color: colorScheme.secondary,
                            height: height,
                            percent: 0.022,
                            maxLines: 20,
                            fontWeight: FontWeight.normal
                        ),
                        contentPadding: EdgeInsets.zero,
                      )
                  ),
                  AppSizeBoxStyle.sizeBox(height: height, percentage: 0.022),
                  AppTextStyles.autoBodyStyle(
                      text: ConsentimientoText.dudasParticipante,
                      color: colorScheme.primary,
                      height: height,
                      maxLines: 15,
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

}