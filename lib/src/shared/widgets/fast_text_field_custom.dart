import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter/services.dart';

class FastTextFieldCustom extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String errorText;
  final bool enabled;
  final bool isInvalid;
  final void Function(String?)? onChanged;
  final Future<void> Function()? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType typeKeyboard;
  final bool readOnly;

  const FastTextFieldCustom({
    super.key,
    required this.controller,
    this.hintText = '',
    required this.labelText,
    this.errorText = '',
    this.enabled = true,
    this.isInvalid = false,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.inputFormatters,
    this.typeKeyboard = TextInputType.text,
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
            height: height*0.07,
            width: double.infinity,
            child: FastTextField(
              name: labelText,
              initialValue: controller.text,
              onChanged: (value) {
                controller.text = value ?? '';
                if (onChanged != null) {
                  onChanged!(value ?? '');
                }
                },
              onTap: onTap,
              readOnly: readOnly,
              decoration: InputDecoration(
                hintText: hintText,
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
                prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: isInvalid ? colorScheme.error : colorScheme.onBackground) : null,
                suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: isInvalid ? colorScheme.error : colorScheme.onBackground) : null,
                filled: true,
                fillColor: enabled
                    ? brightness == Brightness.light ? Colors.white.withOpacity(0.7) : Colors.black38
                    : null,
              ),
              keyboardType: typeKeyboard,
              inputFormatters: inputFormatters,
              style: TextStyle(
                color: isInvalid ? colorScheme.error : colorScheme.onBackground,
                fontSize: height * 0.025,
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
        ]
    );
  }
}