import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

class FastTextFieldPassword extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String labelText;
  final bool isInvalid;
  final String errorText;
  final VoidCallback toggleVisibility;
  final bool obscureText;
  final bool enabled;

  const FastTextFieldPassword({
    super.key,
    required this.onChanged,
    required this.labelText,
    required this.isInvalid,
    required this.errorText,
    required this.toggleVisibility,
    required this.obscureText,
    this.enabled = true
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextStyles.autoBodyStyle(
            text: labelText,
            color: colorScheme.onBackground,
            height: height
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
        SizedBox(
          height: height * 0.09,
          width: double.infinity,
          child: FastTextField(
            name: labelText,
            obscureText: obscureText,
            onChanged: (value) {
              onChanged(value ?? '');
            },
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
            decoration: InputDecoration(
              hintText: labelText,
              hintStyle: AppTextStyles.bodyStyle(color: colorScheme.onBackground.withOpacity(0.4), size: height * 0.022),
              labelText: null,
              errorStyle: AppTextStyles.bodyStyle(color: colorScheme.error, size: height * 0.015),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isInvalid ? colorScheme.error : colorScheme.onBackground.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isInvalid ? colorScheme.error : colorScheme.onBackground,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.error),
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: IconButton(
                icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: toggleVisibility,
              ),
              filled: true,
              fillColor: enabled
                  ? brightness == Brightness.light ? Colors.white : Colors.black38
                  : null,
            ),
            style: TextStyle(
              color: isInvalid ? colorScheme.error : colorScheme.onBackground,
              fontSize: height * 0.025,
            ),
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
