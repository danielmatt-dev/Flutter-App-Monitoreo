import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class CardRecommendation extends StatelessWidget {

  final String title;
  final String description;
  final String type;

  const CardRecommendation({
    super.key,
    required this.title,
    required this.description,
    required this.type
  });

  IconData getIconForType(String type) {
    switch (type) {
      case 'Recomendación':
        return Icons.thumb_up;
      case 'Sugerencia':
        return Icons.lightbulb_rounded;
      case 'Aclaración':
        return Icons.info_rounded;
      case 'Recordatorio':
        return Icons.notifications_rounded;
      case 'Alerta':
        return Icons.warning_rounded;
      default:
        return Icons.notifications_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Padding(
    padding: const EdgeInsets.all(5.0),
    child: ExpansionTileCard(
      leading: CircleAvatar(
        backgroundColor: colorScheme.onBackground,
        minRadius: 15,
        maxRadius: 15,
        child: Icon(
          getIconForType(type),
          color: colorScheme.background,
          size: 20,
        ),
      ),
      title: AppTextStyles.autoBodyStyle(
          text: title,
          color: colorScheme.onBackground,
          height: height,
          maxLines: 10
      ),
      subtitle: AppTextStyles.autoBodyStyle(
        text: type,
        color: colorScheme.onBackground,
        height: height,
        percent: 0.02,
        maxLines: 20
      ),
      children: [
        const Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey,
          indent: 20,
          endIndent: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s... ',
                style: AppTextStyles.bodyStyle(
                    color: colorScheme.onBackground,
                    size: height * 0.02
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ],
    )
    );
  }

}