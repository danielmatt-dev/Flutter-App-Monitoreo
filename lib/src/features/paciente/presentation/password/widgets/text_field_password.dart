import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPassword extends StatelessWidget {

  final ValueChanged<String> onChanged;
  final String labelText;
  final bool isInvalid;
  final String errorText;
  final VoidCallback toggleVisibility;
  final bool obscureText;

  const TextFieldPassword({
    super.key,
    required this.onChanged,
    required this.labelText,
    required this.isInvalid,
    required this.errorText,
    required this.toggleVisibility,
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return TextField(
      onChanged: onChanged,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: isInvalid
          ? AppTextStyles.bodyStyle(color: colorScheme.error, size: SizeIcon.size18,)
          : AppTextStyles.bodyStyle(color: colorScheme.primary, size: SizeIcon.size18,),
        errorStyle: AppTextStyles.bodyStyle(color: colorScheme.error, size: height * 0.015),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: isInvalid ? colorScheme.error : colorScheme.primary
            )
        ),
        errorText: isInvalid ? errorText : null,
        suffixIcon: IconButton(
          icon: Icon( obscureText
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: toggleVisibility,
        ),
      ),
      style: isInvalid
        ? AppTextStyles.bodyStyle(color: colorScheme.error, size: SizeIcon.size18)
        : AppTextStyles.bodyStyle(color: colorScheme.primary, size: height * 0.025),
      obscureText: obscureText,
    );

  }

}