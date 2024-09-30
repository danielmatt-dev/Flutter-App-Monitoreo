import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SelectPeriod extends StatefulWidget {

  final Color containerColor;
  final Color titleColor;
  final Color? textColor;
  final ValueChanged<int> onPeriodChanged;

  const SelectPeriod({
    super.key,
    required this.onPeriodChanged,
    required this.containerColor,
    required this.titleColor,
    this.textColor
  });

  @override
  State<SelectPeriod> createState() => _SelectPeriodState();
}

class _SelectPeriodState extends State<SelectPeriod> {

  int _selectedPeriodo = 4;

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0.5,
      color: colorScheme.onPrimary,
      child: Column(
        children: [
          Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.containerColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),),
              ),
              child: AppTextStyles.autoButtonStyle(
                text: 'Periodo',
                color: widget.titleColor,
              )
          ),
          SizedBox(
           height: 200,
           child: Column(
             children: [
               Expanded(
                 child: RadioListTile<int>(
                   activeColor: widget.textColor ?? colorScheme.primary,
                   value: 4,
                   groupValue: _selectedPeriodo,
                   title: AppTextStyles.autoBodyStyle(
                       text: '4 semanas',
                       color: widget.textColor ?? colorScheme.primary,
                   ),
                   onChanged: (value) {
                     setState(() {
                       _selectedPeriodo = value!;
                     });
                     widget.onPeriodChanged(value!);
                   },
                 ),
               ),
               Expanded(
                 child: RadioListTile<int>(
                   activeColor: widget.textColor ?? colorScheme.primary,
                   value: 8,
                   groupValue: _selectedPeriodo,
                   title: AppTextStyles.autoBodyStyle(
                       text: '8 semanas',
                       color: widget.textColor ?? colorScheme.primary,
                   ),
                   onChanged: (value) {
                     setState(() {
                       _selectedPeriodo = value!;
                     });
                     widget.onPeriodChanged(value!);
                   },
                 ),
               ),
               Expanded(
                 child: RadioListTile<int>(
                   activeColor: widget.textColor ?? colorScheme.primary,
                   shape: const RoundedRectangleBorder(
                       borderRadius: BorderRadius.vertical(
                         bottom: Radius.circular(12),
                       )
                   ),
                   value: 12,
                   groupValue: _selectedPeriodo,
                   title: AppTextStyles.autoBodyStyle(
                       text: '12 semanas',
                       color: widget.textColor ?? colorScheme.primary,
                   ),
                   onChanged: (value) {
                     setState(() {
                       _selectedPeriodo = value!;
                     });
                     widget.onPeriodChanged(value!);
                   },
                 ),
               ),
             ],
           ),
          )
        ],
      ),
    );
  }
}