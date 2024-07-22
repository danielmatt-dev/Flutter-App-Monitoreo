import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

class FastTextFieldCustom extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final double hintOpacity;
  final String labelText;
  final String errorText;
  final bool enabled;
  final bool isInvalid;
  final ValueChanged<String>?  onChanged;
  final Future<void> Function()? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType typeKeyboard;
  final bool readOnly;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? hintColor;
  final double sizePorcent;

  const FastTextFieldCustom({
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
    this.backgroundColor,
    this.borderColor,
    this.sizePorcent = 0.07,
    this.hintColor
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height*sizePorcent,
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
          hintStyle: AppTextStyles.bodyStyle(
              color: hintColor ?? colorScheme.onBackground.withOpacity(hintOpacity),
              size: height * 0.022
          ),
          labelText: null,
          errorStyle: AppTextStyles.bodyStyle(color: colorScheme.error, size: height * 0.015),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? (isInvalid
                  ? colorScheme.error
                  : colorScheme.onBackground.withOpacity(0.2)),
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
          fillColor: backgroundColor ??
              (brightness == Brightness.light ? Colors.white : Colors.black38),
        ),
        keyboardType: typeKeyboard,
        inputFormatters: inputFormatters,
        style: TextStyle(
          color: isInvalid ? colorScheme.error : colorScheme.onBackground,
          fontSize: height * 0.025,
          fontWeight: FontWeight.w500,
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }

}