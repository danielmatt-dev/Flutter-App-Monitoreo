import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Color? titleColor;
  final double percentaje;

  const InfoSection({
    super.key,
    required this.title,
    required this.children,
    this.titleColor,
    this.percentaje = 0.025
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextStyles.autoBodyStyle(
            text: title,
            color: titleColor ?? colorScheme.secondary,
            size: SizeIcon.size22,
          ),
          AppSizeBoxStyle.sizeBox(height: height, percentage: percentaje),
          Column(children: children),
        ],
      ),
    );
  }
}