import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class TrafficLight extends StatelessWidget {

  final String title;
  final List<String> titles;
  final List<String> colors;

  const TrafficLight({
    super.key,
    required this.title,
    required this.titles,
    required this.colors
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final color = Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          const SizedBox(height: 16),
          AppTextStyles.autoBodyStyle(
              text: title,
              color: color,
              height: height,
              percent: 0.02
          ),
          const SizedBox(height: 16),
          ...List.generate(titles.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: LightWidget(
                text: titles[index],
                color: colors[index],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class LightWidget extends StatelessWidget {

  final String text;
  final String color;

  const LightWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorText = Theme.of(context).colorScheme.onBackground;

    return Row(
      children: [
        Icon(Icons.label, color: mapColor[color], size: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AppTextStyles.autoBodyStyle(
              text: text,
              color: colorText,
              height: height,
              percent: 0.02
          ),
        ),
      ],
    );
  }

}


