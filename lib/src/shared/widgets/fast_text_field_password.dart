import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

class FastTextFieldPassword extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final double hintOpacity;
  final String labelText;
  final Color? hintColor;
  final bool isInvalid;
  final String errorText;
  final VoidCallback toggleVisibility;
  final bool obscureText;
  final bool enabled;
  final Color? backgroundColor;
  final IconData? prefixIcon;

  const FastTextFieldPassword({
    super.key,
    required this.onChanged,
    this.hintText = '',
    this.hintOpacity = 0.4,
    this.hintColor,
    required this.labelText,
    required this.isInvalid,
    required this.errorText,
    required this.toggleVisibility,
    required this.obscureText,
    this.enabled = true,
    this.backgroundColor,
    this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final height = MediaQuery.of(context).size.height;

    OutlineInputBorder buildBorder(Color color) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(8),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextStyles.autoBodyStyle(
            text: labelText,
            color: colorScheme.onBackground,
            height: height
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
        FastTextField(
          name: labelText,
          obscureText: obscureText,
          onChanged: (value) {
            onChanged(value ?? '');
          },
          inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyStyle(
              color: hintColor ?? colorScheme.onBackground.withOpacity(hintOpacity),
              size: height * 0.022,
            ),
            errorText: isInvalid ? errorText : null,
            errorStyle: AppTextStyles.bodyStyle(color: colorScheme.error, size: height * 0.015),
            enabledBorder: buildBorder(isInvalid ? colorScheme.error : colorScheme.onBackground.withOpacity(0.2)),
            focusedErrorBorder: buildBorder(colorScheme.error),
            focusedBorder: buildBorder(isInvalid ? colorScheme.error : colorScheme.onBackground),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.error),
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: isInvalid ? colorScheme.error : colorScheme.onBackground) : null,
            suffixIcon: IconButton(
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: toggleVisibility,
            ),
            filled: true,
            fillColor: backgroundColor ?? (brightness == Brightness.light ? Colors.white : Colors.black38),
          ),
          style: TextStyle(
            color: isInvalid ? colorScheme.error : colorScheme.onBackground,
            fontSize: height * 0.025,
            fontWeight: FontWeight.w500,
          ),
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
