import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardTimeline extends StatelessWidget {

  final String titulo;
  final String hora;
  final String subtitulo;
  final Color color;

  const CardTimeline({
    super.key,
    required this.titulo,
    required this.hora,
    required this.subtitulo,
    required this.color
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: AppTextStyles.autoBodyStyle(
                text: hora,
                color: colorScheme.primary,
                size: SizeIcon.size16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: 5,
              height: 50,
              color: color,
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextStyles.autoBodyStyle(
                  text: titulo,
                  color: colorScheme.primary,
                ),
                AppTextStyles.autoBodyStyle(
                  text: subtitulo,
                  color: colorScheme.primary,
                  maxLines: 2,
                  size: SizeIcon.size16,
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

}
