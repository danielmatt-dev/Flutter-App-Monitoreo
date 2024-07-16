import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String errorText;
  final bool enabled;
  final bool isInvalid;
  final ValueChanged<String>? onChanged;
  final IconData? icon;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldCustom({
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
  });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();

}

class _TextFieldCustomState extends State<TextFieldCustom> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final height = MediaQuery.of(context).size.height;

    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.bodyStyle(color: colorScheme.onBackground, size: height * 0.025),
        labelText: widget.labelText,
        labelStyle: widget.isInvalid
            ? AppTextStyles.bodyStyle(color: colorScheme.error, size: height * 0.025)
            : AppTextStyles.bodyStyle(color: colorScheme.onBackground, size: height * 0.025),
        errorStyle: AppTextStyles.bodyStyle(color: colorScheme.error, size: height * 0.015),
        enabledBorder: widget.isInvalid
            ? UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error),
        )
            : UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.onBackground),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: widget.isInvalid ? colorScheme.error : colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        prefixIcon: widget.icon != null ? Icon(widget.icon, color: widget.isInvalid ? colorScheme.error : colorScheme.onBackground) : null,
        filled: true,
        fillColor: widget.enabled
            ? brightness == Brightness.light ? Colors.white.withOpacity(0.7) : Colors.black38
            : null,
      ),
      cursorColor: widget.isInvalid ? colorScheme.error : colorScheme.onBackground,
      style: widget.isInvalid
          ? AppTextStyles.bodyStyle(color: colorScheme.error, size: height * 0.025)
          : AppTextStyles.bodyStyle(color: colorScheme.onBackground, size: height * 0.025),
    );
  }
}