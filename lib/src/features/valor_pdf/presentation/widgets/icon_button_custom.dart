import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/core/theme/colors.dart';
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

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: colorScheme.onPrimary,),
        label: AppTextStyles.autoButtonStyle(
          text: text,
          color: colorScheme.onPrimary,
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
          disabledBackgroundColor: color.shade(0.99)
        ),
      ),
    );
  }

}