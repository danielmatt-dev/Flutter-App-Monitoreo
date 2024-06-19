import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardRecommendation extends StatelessWidget {

  final String title;
  final String description;

  const CardRecommendation({
    super.key,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Card(
      elevation: 0.5,
      color: colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
            children: [
              Icon(
                Icons.notifications_outlined,
                size: 30,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 10,),
              Container(
                width: 2,
                height: 30,
                color: colorScheme.primary,
                margin: const EdgeInsets.only(right: 10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                ],
              ),
            ],
          ),
            AppTextStyles.autoBodyStyle(
              text: title,
              color: colorScheme.onBackground,
              height: height
                            ),
                            AppTextStyles.autoBodyStyle(
              text: 'En una tranquila mañana de verano, el sol brillaba intensamente sobre el verde prado. Los pájaros cantaban alegremente en los árboles mientras las mariposas revoloteaban de flor en flor. El aire fresco llevaba consigo el aroma de las flores y el sonido lejano de un río que corría suavemente.',
              color: colorScheme.onBackground,
              height: height,
              maxLines: 5
                            ),

      ]
        ),
      ),
    );

  }

}