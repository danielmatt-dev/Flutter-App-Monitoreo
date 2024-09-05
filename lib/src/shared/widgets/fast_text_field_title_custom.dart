import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/shared/widgets/fast_text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldTitleCustom extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;
  final double hintOpacity;
  final String labelText;
  final String errorText;
  final bool enabled;
  final bool isInvalid;
  final bool helpIcon;
  final ValueChanged<String>? onChanged;
  final Future<void> Function()? onTap;
  final VoidCallback? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType typeKeyboard;
  final int? maxLenght;
  final bool readOnly;
  final int maxLines;

  const TextFieldTitleCustom({
    super.key,
    required this.controller,
    this.hintText = '',
    this.hintOpacity = 0.4,
    required this.labelText,
    this.errorText = '',
    this.enabled = true,
    this.isInvalid = false,
    this.helpIcon = false,
    this.onChanged,
    this.onTap,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.inputFormatters,
    this.typeKeyboard = TextInputType.text,
    this.maxLenght,
    this.maxLines = 1
  });

  @override
  State<TextFieldTitleCustom> createState() => _TextFieldTitleCustomState();
}

class _TextFieldTitleCustomState extends State<TextFieldTitleCustom> {
  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextStyles.autoBodyStyle(
                    text: widget.labelText,
                    color: colorScheme.primary,
                    height: height
                ),
                if (widget.helpIcon)
                  IconButton(
                      onPressed: widget.onPressed,
                      icon: Icon(Icons.help_outline_rounded,
                        color: colorScheme.primary,
                        size: 18,
                      )
                  )
              ]
          ),
          AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
          FastTextFieldCustom(
            controller: widget.controller,
            hintText: widget.hintText,
            hintOpacity: widget.hintOpacity,
            labelText: widget.labelText,
            errorText: widget.errorText,
            enabled: widget.enabled,
            isInvalid: widget.isInvalid,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            inputFormatters: widget.inputFormatters,
            typeKeyboard: widget.typeKeyboard,
            readOnly: widget.readOnly,
            maxLenght: widget.maxLenght,
            maxLines: widget.maxLines,
          ),
        ]
    );
  }
}