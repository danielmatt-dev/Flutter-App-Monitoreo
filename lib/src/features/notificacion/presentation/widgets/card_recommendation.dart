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

  Icon getIconForType(String type, Color color) {
    switch (type) {
      case 'Recomendación':
        return Icon(Icons.thumb_up, size: 20, color: color,);
      case 'Sugerencia':
        return Icon(Icons.lightbulb_rounded, size: 20, color: color,);
      case 'Aclaración':
        return Icon(Icons.info_rounded, size: 20, color: color,);
      case 'Recordatorio':
        return Icon(Icons.notifications_rounded, size: 20, color: color,);
      case 'Alerta':
        return Icon(Icons.warning_rounded, size: 20, color: color,);
      default:
        return Icon(Icons.notifications_rounded, size: 20, color: color,);
    }
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;
    final icon = getIconForType(type, colorScheme.background);

    return Padding(
    padding: const EdgeInsets.all(5.0),
    child: ExpansionTileCard(
      leading: CircleAvatar(
        backgroundColor: colorScheme.onBackground,
        minRadius: 15,
        maxRadius: 15,
        child: icon,
      ),
      title: AppTextStyles.autoBodyStyle(
          text: title,
          color: colorScheme.onBackground,
          height: height,
          percent: 0.03
      ),
      subtitle: AppTextStyles.autoBodyStyle(
        text: type,
        color: colorScheme.onBackground,
        height: height,
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
                    size: height * 0.025
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