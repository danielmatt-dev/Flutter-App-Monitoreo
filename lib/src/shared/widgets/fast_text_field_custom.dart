import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FastTextFieldCustom extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;
  final double hintOpacity;
  final String labelText;
  final String errorText;
  final bool enabled;
  final bool isInvalid;
  final ValueChanged<String>? onChanged;
  final Future<void> Function()? onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType typeKeyboard;
  final bool readOnly;
  final int? maxLenght;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? hintColor;
  final int maxLines;

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
    this.maxLenght,
    this.backgroundColor,
    this.borderColor,
    this.hintColor,
    this.maxLines = 1
  });

  @override
  State<FastTextFieldCustom> createState() => _FastTextFieldCustomState();
}

class _FastTextFieldCustomState extends State<FastTextFieldCustom> {
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

    return TextField(
      maxLength: widget.maxLenght,
      //name: widget.labelText,
      controller: widget.controller,
      enabled: widget.enabled,
      onChanged: (value) {
        setState(() {
          widget.controller.text = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onTap: widget.onTap,
      cursorColor: widget.isInvalid ? colorScheme.error : colorScheme.primary,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.bodyStyle(
          color: widget.isInvalid ? colorScheme.error : widget.hintColor ?? colorScheme.primary.withOpacity(widget.hintOpacity),
          size: SizeIcon.size16,
        ),
        errorText: widget.isInvalid ? widget.errorText : null,
        errorStyle: AppTextStyles.bodyStyle(
          color: colorScheme.error,
          size: SizeIcon.size16,
        ),
        enabledBorder: buildBorder(widget.isInvalid ? colorScheme.error : colorScheme.primary.withOpacity(0.2)),
        focusedErrorBorder: buildBorder(colorScheme.error),
        focusedBorder: buildBorder(widget.isInvalid ? colorScheme.error : colorScheme.primary),
        errorBorder: buildBorder(colorScheme.error),
        disabledBorder: buildBorder(widget.isInvalid ? colorScheme.error : colorScheme.primary.withOpacity(0.2)),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, color: widget.isInvalid ? colorScheme.error : colorScheme.primary) : null,
        suffixIcon: widget.suffixIcon != null ? Icon(widget.suffixIcon, color: widget.isInvalid ? colorScheme.error : colorScheme.primary) : null,
        filled: true,
        fillColor: widget.backgroundColor ?? (brightness == Brightness.light ? Colors.white : Colors.black38),
        counterText: ''
      ),
      keyboardType: widget.typeKeyboard,
      inputFormatters: widget.inputFormatters,
      style: TextStyle(
        color: widget.isInvalid ? colorScheme.error : colorScheme.primary,
        fontSize: SizeIcon.size18,
        fontWeight: FontWeight.w500,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}