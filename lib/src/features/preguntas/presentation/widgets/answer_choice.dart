import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AnswerChoice extends StatelessWidget {

  final String text;
  final bool selected;
  final VoidCallback onTap;

  const AnswerChoice({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: selected ? colorScheme.secondary : colorScheme.background,
          border: Border.all(color: colorScheme.secondary, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: AppTextStyles.autoBodyStyle(
              text: text,
              color: selected ? colorScheme.onPrimary : colorScheme.secondary,
              height: height,
              percent: 0.028
          ),
        ),
      ),
    );
  }

}