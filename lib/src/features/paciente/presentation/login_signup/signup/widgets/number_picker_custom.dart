import 'package:app_plataforma/src/core/styles/app_size_box_styles.dart';
import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerCustom extends StatefulWidget {

  final String labelText;
  final ValueChanged<int> onChanged;

  const NumberPickerCustom({
    super.key,
    required this.labelText,
    required this.onChanged
  });

  @override
  State<NumberPickerCustom> createState() => _NumberPickerCustomState();

}

class _NumberPickerCustomState extends State<NumberPickerCustom> {

  bool _isSelected = false;
  int _currentIntValue = 1;

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextStyles.autoBodyStyle(
            text: widget.labelText,
            color: colorScheme.onBackground,
            height: height
        ),
        AppSizeBoxStyle.sizeBox(height: height, percentage: 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isSelected = true;
                });
                },
              child: NumberPicker(
              value: _currentIntValue,
              minValue: 0,
              maxValue: 50,
              step: 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _isSelected ? colorScheme.onBackground : colorScheme.onBackground.withOpacity(0.4)),
              ),
              itemHeight: height*0.05,
              textStyle: AppTextStyles.bodyStyle(
                  color: colorScheme.onBackground,
                  size: height*0.022
              ),
              selectedTextStyle: AppTextStyles.bodyStyle(
                  color: colorScheme.onBackground,
                  size: height*0.035
              ),
              axis: Axis.horizontal,
              onChanged: (value) => setState(() {
                _currentIntValue = value;
                widget.onChanged(_currentIntValue);
              }),
              ),
            ),
          ]
        ),
      ],
    );
  }
}