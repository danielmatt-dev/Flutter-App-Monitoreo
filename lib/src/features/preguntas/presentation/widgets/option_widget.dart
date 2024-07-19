import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {

  final String respuesta;
  final int index;
  final Color? backgroundColor;
  final String? selectedResponse;
  final Function(int?)? onChanged;

  const OptionWidget({
    super.key,
    required this.respuesta,
    required this.index,
    this.backgroundColor,
    this.selectedResponse,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: selectedResponse == respuesta
            ? colorScheme.secondary
            : backgroundColor ?? colorScheme.background,
        border: Border.all(color: colorScheme.secondary),
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
                  ? colorScheme.background
                  : colorScheme.secondary,
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
        ),
        activeColor: Colors.white,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }

}