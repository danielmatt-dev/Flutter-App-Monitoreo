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
    final height = MediaQuery.of(context).size.height;

    return ListTile(
      leading: SizedBox(
        width: height*0.09,
        child: Center(
          child: AppTextStyles.autoBodyStyle(
              text: hora,
              color: colorScheme.primary,
              maxLines: 1,
              height: height,
              percent: 0.01
          ),
        ),
      ),
      title: Row(
        children: [
          Container(
            width: 5,
            height: 50,
            color: color,
            margin: const EdgeInsets.only(right: 10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextStyles.autoBodyStyle(
                  text: titulo,
                  color: colorScheme.primary,
                  maxLines: 1,
                  height: height
              ),
              AppTextStyles.autoBodyStyle(
                  text: subtitulo,
                  color: colorScheme.primary,
                  maxLines: 1,
                  height: height,
                  percent: 0.02
              )
            ],
          )
        ],
      ),
    );

  }

}
