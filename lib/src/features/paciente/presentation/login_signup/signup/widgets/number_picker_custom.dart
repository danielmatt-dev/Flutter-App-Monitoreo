import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerCustom extends StatefulWidget {

  final String labelText;
  final ValueChanged<int> onChanged;
  final int minValue;
  final int currentValue;
  final int maxValue;
  final int step;
  final String measure;
  final double positionTop;
  final double positionBottom;
  final double heightContainer;
  final Alignment alignment;
  final bool helpIcon;
  final VoidCallback? onPressed;

  const NumberPickerCustom({
    super.key,
    required this.labelText,
    required this.onChanged,
    required this.minValue,
    required this.currentValue,
    required this.maxValue,
    required this.step,
    this.measure = '',
    this.positionTop = -12,
    this.positionBottom = 36,
    this.alignment = Alignment.bottomCenter,
    required this.heightContainer,
    this.helpIcon = false,
    this.onPressed
  });

  @override
  State<NumberPickerCustom> createState() => _NumberPickerCustomState();
}

class _NumberPickerCustomState extends State<NumberPickerCustom> {

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
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
              IconButton(
                  onPressed: widget.onPressed,
                  icon: Icon(widget.helpIcon
                      ? Icons.help_outline_rounded
                      : null,
                    color: colorScheme.primary,
                    size: 18,
                  )
              )
            ]
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: widget.heightContainer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: brightness == Brightness.light
                    ? Colors.white
                    : Colors.black38,
                border: Border.all(color: colorScheme.primary.withOpacity(0.4)),
              ),
              child: Align(
                alignment: widget.alignment,
                child: NumberPicker(
                  value: widget.currentValue,
                  minValue: widget.minValue,
                  maxValue: widget.maxValue,
                  step: widget.step,
                  itemHeight: height * 0.05,
                  itemWidth: height * 0.06,
                  itemCount: 7,
                  textStyle: AppTextStyles.bodyStyle(
                      color: colorScheme.primary,
                      size: height*0.02
                  ),
                  selectedTextStyle: AppTextStyles.bodyStyle(
                      color: colorScheme.primary,
                      size: height*0.03
                  ),
                  axis: Axis.horizontal,
                  onChanged: (value) => setState(() {
                    widget.onChanged(value);
                  }),
                ),
              ),
            ),
            Positioned(
              top: widget.positionTop,
              child: Icon(
                Icons.arrow_drop_down_rounded,
                size: height * 0.05,
                color: colorScheme.primary,
              ),
            ),
            Positioned(
              top: widget.positionBottom,
              child: AppTextStyles.autoBodyStyle(
                  text: widget.measure,
                  color: colorScheme.primary,
                  height: height,
                  percent: 0.015
              ),
            ),
          ],
        ),
      ],
    );
  }
}