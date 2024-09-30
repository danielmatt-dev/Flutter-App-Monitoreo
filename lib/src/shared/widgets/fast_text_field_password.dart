import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FastTextFieldPassword extends StatefulWidget {
  final TextEditingController? controller;
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
    this.controller,
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
  State<FastTextFieldPassword> createState() => _FastTextFieldPasswordState();
}

class _FastTextFieldPasswordState extends State<FastTextFieldPassword> {
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
            text: widget.labelText,
            color: colorScheme.primary,
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
        TextField(
          obscureText: widget.obscureText,
          onChanged: widget.onChanged,
          inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTextStyles.bodyStyle(
              color: widget.isInvalid ? colorScheme.error : widget.hintColor ?? colorScheme.primary.withOpacity(widget.hintOpacity),
              size: SizeIcon.size16,
            ),
            errorText: widget.isInvalid ? widget.errorText : null,
            errorStyle: AppTextStyles.bodyStyle(color: colorScheme.error, size: SizeIcon.size12,),
            enabledBorder: buildBorder(widget.isInvalid ? colorScheme.error : colorScheme.primary.withOpacity(0.2)),
            focusedErrorBorder: buildBorder(colorScheme.error),
            focusedBorder: buildBorder(widget.isInvalid ? colorScheme.error : colorScheme.primary),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.error),
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, color: widget.isInvalid ? colorScheme.error : colorScheme.primary) : null,
            suffixIcon: IconButton(
              icon: Icon(widget.obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: widget.toggleVisibility,
            ),
            filled: true,
            fillColor: widget.backgroundColor ?? (brightness == Brightness.light ? Colors.white : Colors.black38),
          ),
          style: TextStyle(
            color: widget.isInvalid ? colorScheme.error : colorScheme.primary,
            fontSize: SizeIcon.size18,
            fontWeight: FontWeight.w500,
          ),
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
