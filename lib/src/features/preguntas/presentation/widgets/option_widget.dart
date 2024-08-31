import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {

  final String respuesta;
  final int index;
  final Color? backgroundColor;
  final String? selectedResponse;
  final Color? selectedResponseColor;
  final Color? selectedTextColor;
  final Color? textColor;
  final Function(int?)? onChanged;

  const OptionWidget({
    super.key,
    required this.respuesta,
    required this.index,
    this.backgroundColor,
    this.selectedResponse,
    required this.onChanged,
    this.selectedResponseColor,
    this.textColor,
    this.selectedTextColor
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: selectedResponse == respuesta
            ? selectedResponseColor ?? colorScheme.secondary
            : backgroundColor ?? colorScheme.onPrimary,
        border: Border.all(color: selectedResponseColor ?? colorScheme.secondary),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: RadioListTile<int>(
        value: index,
        groupValue: selectedResponse == respuesta
            ? index
            : null,
        onChanged: onChanged,
        title: Text(
          respuesta,
          style: TextStyle(
              color: selectedResponse == respuesta
                  ? selectedTextColor ?? colorScheme.onPrimary
                  : textColor ?? colorScheme.secondary,
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
        ),
        activeColor: selectedTextColor ?? colorScheme.onPrimary,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }

}