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
  final TextInputType typeKeyboard;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? enabledBorderColor;
  final Color? focusedBackgroundColor;
  final Color? focusedBorderColor;
  final int? maxLenght;

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
    this.typeKeyboard = TextInputType.text,
    this.backgroundColor,
    this.borderColor,
    this.hintColor,
    this.textColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.focusedBackgroundColor,
    this.maxLenght,
  });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();

}

class _TextFieldCustomState extends State<TextFieldCustom> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final height = MediaQuery.of(context).size.height;

    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
        if (value.isEmpty) {
          _focusNode.unfocus();
        }
      },
      focusNode: _focusNode,
      keyboardType: widget.typeKeyboard,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLenght,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.isInvalid
              ? colorScheme.error
              : widget.hintColor ?? colorScheme.onBackground.withOpacity(0.4),
          fontSize: height * 0.022,
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.isInvalid ? colorScheme.error : colorScheme.onBackground,
          fontSize: height * 0.025,
        ),
        errorText: widget.isInvalid ? widget.errorText : null,
        errorStyle: TextStyle(
          color: colorScheme.error,
          fontSize: height * 0.015,
        ),
        enabledBorder: buildBorder(widget.isInvalid
            ? colorScheme.error
            : widget.borderColor ?? colorScheme.onBackground.withOpacity(0.2)),
        focusedBorder: buildBorder(widget.isInvalid
            ? colorScheme.error
            : widget.focusedBorderColor ?? colorScheme.primary),
        errorBorder: buildBorder(colorScheme.error),
        prefixIcon: widget.icon != null
            ? Icon(widget.icon,
            color:
            widget.isInvalid ? colorScheme.error : colorScheme.onBackground)
            : null,
        filled: true,
        fillColor: _isFocused
            ? widget.focusedBackgroundColor ?? colorScheme.secondary
            : widget.backgroundColor ?? (brightness == Brightness.light ? Colors.white.withOpacity(0.7) : Colors.black38),
        counterText: '',
      ),
      cursorColor: widget.isInvalid ? colorScheme.error : colorScheme.onBackground,
      style: TextStyle(
        color: widget.isInvalid ? colorScheme.error : colorScheme.onBackground,
        fontSize: height * 0.025,
        fontWeight: FontWeight.w500,
      ),
      textInputAction: TextInputAction.next,
    );
  }
}