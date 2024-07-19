import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:flutter/material.dart';

class TemplateQuiz extends StatelessWidget {

  final String question;
  final List<Widget> children;

  const TemplateQuiz({
    super.key,
    required this.question,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            question,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colorScheme.secondary),
            textAlign: TextAlign.center,
          ),
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.02),
        ...children
      ],
    );
  }

}