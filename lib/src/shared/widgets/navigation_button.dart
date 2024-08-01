import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isValid;
  final Color enabledColor;
  final Color disabledColor;
  final Color textColor;

  const NavigationButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.isValid,
    required this.enabledColor,
    required this.disabledColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isValid ? onPressed : null,
      icon: Icon(icon, color: isValid ? textColor : disabledColor),
      label: Text(
        label,
        style: TextStyle(
          color: isValid ? textColor : disabledColor,
          fontSize: MediaQuery.of(context).size.height * 0.02,
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