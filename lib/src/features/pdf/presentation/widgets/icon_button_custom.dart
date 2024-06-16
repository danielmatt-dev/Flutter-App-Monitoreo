import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final Color color;
  final IconData icon;

  const IconButtonCustom({
    super.key, required this.onPressed,
    required this.text,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: AppTextStyles.autoButtonStyle(
          text: text,
          color: colorScheme.background,
          height: height,
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme.background,
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 12),
          minimumSize: Size(double.infinity, height*0.03),
          maximumSize: Size(double.infinity, height*0.12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }

}