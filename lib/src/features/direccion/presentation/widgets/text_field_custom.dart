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
  final Color? focusedHintColor;
  final Color? textColor;
  final Color? focusedTextColor;
  final Color? cursorColor;
  final Color? focusedCursorColor;
  final Color? enabledBorderColor;
  final Color? focusedBackgroundColor;
  final Color? focusedBorderColor;
  final int? maxLenght;
  final VoidCallback? onFocus;

  const TextFieldCustom({
    super.key,
    required this.controller,
    this.hintText = 'Otro',
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
    this.focusedHintColor,
    this.textColor,
    this.focusedTextColor,
    this.cursorColor,
    this.focusedCursorColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.focusedBackgroundColor,
    this.maxLenght,
    this.onFocus,
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
    widget.controller.addListener(_handleTextChange);
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
      if (_isFocused && widget.onFocus != null) {
        widget.onFocus!();
      }
    });
  }

  void _handleTextChange() {
    if (widget.controller.text.isEmpty && _isFocused) {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    widget.controller.removeListener(_handleTextChange);
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

    return GestureDetector(
      onTap: () {
        if (_isFocused && widget.controller.text.isEmpty) {
          _focusNode.unfocus();
        }
      },
      child: TextFormField(
        controller: widget.controller,
        enabled: widget.enabled,
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        focusNode: _focusNode,
        keyboardType: widget.typeKeyboard,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLenght,
        textInputAction: TextInputAction.none,
        decoration: InputDecoration(
          hintText: _isFocused ? 'Otro' : widget.hintText,
          hintStyle: TextStyle(
              color: _isFocused
                  ? widget.focusedHintColor ?? widget.hintColor
                  : widget.isInvalid
                  ? colorScheme.error
                  : widget.hintColor ?? colorScheme.primary.withOpacity(0.4),
              fontSize: SizeIcon.size16,
              fontWeight: FontWeight.w500
          ),
          labelText: _isFocused ? '' : widget.labelText,
          labelStyle: TextStyle(
              color: _isFocused
                  ? widget.focusedHintColor ?? widget.hintColor
                  : widget.isInvalid
                  ? colorScheme.error
                  : widget.hintColor ?? colorScheme.primary.withOpacity(0.4),
              fontSize: SizeIcon.size16,
              fontWeight: FontWeight.w500
          ),
          border: buildBorder(
            widget.isInvalid
                ? colorScheme.error
                : widget.borderColor ?? colorScheme.primary.withOpacity(0.4),
          ),
          errorText: widget.isInvalid ? widget.errorText : null,
          errorStyle: TextStyle(
            color: colorScheme.error,
            fontSize: SizeIcon.size12,
          ),
          enabledBorder: buildBorder(widget.isInvalid
              ? colorScheme.error
              : widget.enabledBorderColor ?? colorScheme.primary.withOpacity(0.2)),
          focusedBorder: buildBorder(widget.isInvalid
              ? colorScheme.error
              : widget.focusedBorderColor ?? colorScheme.primary),
          errorBorder: buildBorder(colorScheme.error),
          prefixIcon: widget.icon != null
              ? Icon(widget.icon,
              color: widget.isInvalid ? colorScheme.error : colorScheme.primary)
              : null,
          filled: true,
          fillColor: _isFocused
              ? widget.focusedBackgroundColor ?? colorScheme.secondary
              : widget.backgroundColor ?? (brightness == Brightness.light ? Colors.white.withOpacity(0.7) : Colors.black38),
          counterText: '',
        ),
        cursorColor: _isFocused
            ? widget.focusedCursorColor ?? colorScheme.primary
            : widget.cursorColor ?? colorScheme.primary,
        style: TextStyle(
          color: _isFocused
              ? widget.focusedTextColor ?? colorScheme.primary
              : widget.isInvalid ? colorScheme.error : widget.textColor ?? colorScheme.primary,
          fontSize: SizeIcon.size18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}