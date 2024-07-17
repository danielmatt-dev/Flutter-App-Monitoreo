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
  final IconData? icon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType typeKeyboard;

  const FastTextFieldCustom({
    super.key,
    required this.controller,
    this.hintText = '',
    required this.labelText,
    this.errorText = '',
    this.enabled = true,
    this.isInvalid = false,
    this.onChanged,
    this.icon,
    this.inputFormatters,
    this.typeKeyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final height = MediaQuery.of(context).size.height;

    return FastTextField(
      name: labelText,
      initialValue: controller.text,
      onChanged: (value) {
        controller.text = value ?? '';
        if (onChanged != null) {
          onChanged!(value ?? '');
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: colorScheme.onBackground, fontSize: height * 0.025),
        labelText: labelText,
        labelStyle: TextStyle(
          color: isInvalid ? colorScheme.error : colorScheme.onBackground,
          fontSize: height * 0.025,
        ),
        errorStyle: TextStyle(color: colorScheme.error, fontSize: height * 0.015),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isInvalid ? colorScheme.error : colorScheme.onBackground,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isInvalid ? colorScheme.error : colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: icon != null ? Icon(icon, color: isInvalid ? colorScheme.error : colorScheme.onBackground) : null,
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
      //controller: controller,
    );
  }
}