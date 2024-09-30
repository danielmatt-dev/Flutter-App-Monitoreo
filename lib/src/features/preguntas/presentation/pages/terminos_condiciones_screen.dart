import 'package:app_plataforma/src/core/menu/app_bar_custom.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/preguntas/presentation/consentimiento_text.dart';
import 'package:flutter/material.dart';

class TerminosCondicionesScreen extends StatelessWidget {

  final bool withDeclaracion;

  const TerminosCondicionesScreen({super.key, required this.withDeclaracion});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          appBar: const AppBarCustom(title: 'Medicina Interna',),
          body: TerminosCondicionesBody(withDeclaracion: withDeclaracion,),
        )
    );
  }

}

class TerminosCondicionesBody extends StatelessWidget {

  final bool withDeclaracion;

  const TerminosCondicionesBody({super.key, required this.withDeclaracion});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AppTextStyles.autoTitleStyle(
            text: ConsentimientoText.titulo,
            color: colorScheme.secondary,
            maxLines: 5
          ),
        ...ConsentimientoText.getMapTerminosCondiciones().entries.map((subtitulo) =>
            ListTile(
              title: AppTextStyles.autoBodyStyle(
                  text: subtitulo.key,
                  color: colorScheme.secondary,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                size: SizeIcon.size18
              ),
              subtitle: AppTextStyles.autoBodyStyle(
                text: subtitulo.value,
                color: colorScheme.secondary,
                size: SizeIcon.size14,
                maxLines: 100
              ),
              contentPadding: EdgeInsets.zero,
            )),
        ],
      ),
    );
  }
}
