import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/consentimiento_text.dart';
import 'package:flutter/material.dart';

class ConsentimientoScreen extends StatelessWidget {

  final bool withDeclaracion;

  const ConsentimientoScreen({super.key, required this.withDeclaracion});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          appBar: const AppBarCustom(title: 'Medicina Interna',),
          body: ConsentimientoBody(withDeclaracion: withDeclaracion,),
        )
    );
  }

}

class ConsentimientoBody extends StatelessWidget {

  final bool withDeclaracion;

  const ConsentimientoBody({super.key, required this.withDeclaracion});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
                  maxLines: 20
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
                    maxLines: 20
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
          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.022),
          if(withDeclaracion)
            Column(
              children: [
                ListTile(
                  title: AppTextStyles.autoBodyStyle(
                      text: ConsentimientoText.declaracion,
                      color: colorScheme.primary,
                      height: height,
                      maxLines: 5,
                      textAlign: TextAlign.left
                  ),
                  subtitle: AppTextStyles.autoBodyStyle(
                      text: ConsentimientoText.infoDeclaracion,
                      color: colorScheme.secondary,
                      height: height,
                      percent: 0.022,
                      maxLines: 20
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
