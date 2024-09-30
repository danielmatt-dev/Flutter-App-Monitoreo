import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class DecimalPickerCustom extends StatefulWidget {

  final String labelText;
  final ValueChanged<double> onChanged;
  final int minValue;
  final double currentValue;
  final int maxValue;
  final int step;
  final String measure;

  const DecimalPickerCustom({
    super.key,
    required this.labelText,
    required this.onChanged,
    required this.minValue,
    required this.currentValue,
    required this.maxValue,
    required this.step,
    this.measure = ''
  });

  @override
  State<DecimalPickerCustom> createState() => _DecimalPickerCustomState();
}

class _DecimalPickerCustomState extends State<DecimalPickerCustom> {

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextStyles.autoBodyStyle(
            text: widget.labelText,
            color: colorScheme.primary,
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: brightness == Brightness.light
                    ? Colors.white
                    : Colors.black38,
                border: Border.all(color: colorScheme.primary.withOpacity(0.4)),
              ),
              child: Center(
                child: DecimalNumberPicker(
                  value: widget.currentValue,
                  minValue: widget.minValue,
                  maxValue: widget.maxValue,
                  decimalPlaces: widget.step,
                  itemHeight: 30,
                  itemWidth: 50,
                  itemCount: 3,
                  textStyle: AppTextStyles.bodyStyle(
                      color: colorScheme.primary,
                      size: SizeIcon.size14,
                  ),
                  selectedTextStyle: AppTextStyles.bodyStyle(
                      color: colorScheme.primary,
                      size: SizeIcon.size18,
                  ),
                  axis: Axis.vertical,
                  onChanged: (value) => setState(() {
                    widget.onChanged(value);
                  }),
                ),
              ),
            ),
            Positioned(
              left: 80,
              bottom: 25,
              child: Icon(
                Icons.arrow_right_rounded,
                size: 35,
                color: colorScheme.primary,
              ),
            ),
            Positioned(
              right: 80,
              bottom: 32,
              child: AppTextStyles.autoBodyStyle(
                text: widget.measure,
                color: colorScheme.primary,
                size: SizeIcon.size14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}