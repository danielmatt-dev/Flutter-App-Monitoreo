import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FastTextFieldTitleCustom extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final double hintOpacity;
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

  const FastTextFieldTitleCustom({
    super.key,
    required this.controller,
    this.hintText = '',
    this.hintOpacity = 0.4,
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
          FastTextFieldCustom(
            controller: controller,
            hintText: hintText,
            hintOpacity: hintOpacity,
            labelText: labelText,
            errorText: errorText,
            enabled: enabled,
            isInvalid: isInvalid,
            onChanged: onChanged,
            onTap: onTap,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            inputFormatters: inputFormatters,
            typeKeyboard: typeKeyboard,
            readOnly: readOnly,
          ),
        ]
    );
  }
}