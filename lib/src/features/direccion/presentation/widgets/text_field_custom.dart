import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final String errorText;
  final bool enabled;
  final bool isInvalid;
  final ValueChanged<String>? onChanged;

  const TextFieldCustom({
    super.key,
    required this.controller,
    required this.labelText,
    this.errorText = '',
    this.enabled = true,
    this.isInvalid = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return TextField(
      controller: controller,
      enabled: enabled,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: isInvalid
            ? AppTextStyles.bodyStyle(color: colorScheme.error, size: height * 0.025)
            : AppTextStyles.bodyStyle(color: colorScheme.onBackground, size: height * 0.025),
        errorStyle: AppTextStyles.bodyStyle(color: colorScheme.error, size: height * 0.015),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: isInvalid ? colorScheme.error : colorScheme.onBackground
            )
        ),
        errorText: isInvalid ? errorText : null,
      ),
      style: isInvalid
          ? AppTextStyles.bodyStyle(color: colorScheme.error, size: height * 0.025)
          : AppTextStyles.bodyStyle(color: colorScheme.onBackground, size: height * 0.025),
    );
  }

}