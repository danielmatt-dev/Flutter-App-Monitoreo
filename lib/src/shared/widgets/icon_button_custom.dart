import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final IconData icon;
  final double horizontal;

  const IconButtonCustom({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.icon,
    this.horizontal = 5
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: isDarkMode ? colorScheme.primary : colorScheme.onPrimary,
        ),
        label: AppTextStyles.autoButtonStyle(
          text: text,
          color: isDarkMode ? colorScheme.primary : colorScheme.onPrimary,
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: isDarkMode ? colorScheme.onPrimary : colorScheme.primary,
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 12),
          minimumSize: const Size(double.infinity, 50),
          maximumSize: const Size(double.infinity, 100),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          disabledBackgroundColor: color
        ),
      ),
    );
  }

}