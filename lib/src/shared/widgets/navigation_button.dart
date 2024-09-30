import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isValid;
  final Color enabledColor;
  final Color? disabledColor;
  final Color? textColor;
  final bool isNext;

  const NavigationButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isValid = true,
    required this.enabledColor,
    this.disabledColor,
    this.textColor,
    this.isNext = false
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isValid ? onPressed : null,
      icon: isNext
          ? Text(
        label,
        style: TextStyle(
          color: isValid ? textColor : disabledColor,
          fontSize: SizeIcon.size14,
        ),
      )
          : Icon(icon, color: isValid ? textColor ?? Theme.of(context).colorScheme.onPrimary : disabledColor),
      label: isNext
          ? Icon(icon, color: isValid ? textColor ?? Theme.of(context).colorScheme.onPrimary : disabledColor)
          : Text(
        label,
        style: TextStyle(
          color: isValid ? textColor : disabledColor,
          fontSize: SizeIcon.size14,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isValid ? enabledColor : disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}