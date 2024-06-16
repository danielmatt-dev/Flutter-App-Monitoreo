import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectPeriod extends StatefulWidget {

  const SelectPeriod({super.key});

  @override
  State<SelectPeriod> createState() => _SelectPeriodState();
}

class _SelectPeriodState extends State<SelectPeriod> {

  int _selectedPeriodo = 4;

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Card(
      elevation: 0.5,
      color: colorScheme.background,
      child: Column(
        children: [
          Container(
              height: height*0.06,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),),
              ),
              child: Expanded(
                child: AppTextStyles.autoButtonStyle(
                  text: 'Periodo',
                  color: colorScheme.onPrimary,
                  height: height,
                ),
              )
          ),
          SizedBox(
           height: height*0.25,
           child: Column(
             children: [
               Expanded(
                 child: RadioListTile<int>(
                   value: 4,
                   groupValue: _selectedPeriodo,
                   title: AppTextStyles.autoBodyStyle(
                       text: '4 semanas',
                       color: colorScheme.primary,
                       maxLines: 1,
                       height: height
                   ),
                   onChanged: (value) {
                     setState(() {
                       _selectedPeriodo = value!;
                     });
                   },
                 ),
               ),
               Expanded(
                 child: RadioListTile<int>(
                   value: 8,
                   groupValue: _selectedPeriodo,
                   title: AppTextStyles.autoBodyStyle(
                       text: '8 semanas',
                       color: colorScheme.primary,
                       maxLines: 1,
                       height: height
                   ),
                   onChanged: (value) {
                     setState(() {
                       _selectedPeriodo = value!;
                     });
                   },
                 ),
               ),
               Expanded(
                 child: RadioListTile<int>(
                   shape: const RoundedRectangleBorder(
                       borderRadius: BorderRadius.vertical(
                         bottom: Radius.circular(12),
                       )
                   ),
                   value: 12,
                   groupValue: _selectedPeriodo,
                   title: AppTextStyles.autoBodyStyle(
                       text: '12 semanas',
                       color: colorScheme.primary,
                       maxLines: 1,
                       height: height
                   ),
                   onChanged: (value) {
                     setState(() {
                       _selectedPeriodo = value!;
                     });
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