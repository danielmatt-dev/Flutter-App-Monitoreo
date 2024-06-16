import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SelectMeasurement extends StatefulWidget {

  final ValueChanged<String> onMeasurementChanged;

  const SelectMeasurement({super.key, required this.onMeasurementChanged});

  @override
  State<SelectMeasurement> createState() => _SelectMeasurementState();
}

class _SelectMeasurementState extends State<SelectMeasurement> {

  String _selectedMedicion = 'Glucosa';

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
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: AppTextStyles.autoButtonStyle(
                text: 'Medición',
                color: colorScheme.onPrimary,
                height: height,
              )
          ),
          SizedBox(
            height: height*0.17,
            child: Column(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Glucosa',
                    groupValue: _selectedMedicion,
                    title: AppTextStyles.autoBodyStyle(
                        text: 'Glucosa',
                        color: colorScheme.primary,
                        maxLines: 1,
                        height: height,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _selectedMedicion = value!;
                      });
                      widget.onMeasurementChanged(value!);
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(12),
                        )
                    ),
                    value: 'Presión',
                    groupValue: _selectedMedicion,
                    title: AppTextStyles.autoBodyStyle(
                        text: 'Presión',
                        color: colorScheme.primary,
                        maxLines: 1,
                        height: height
                    ),
                    onChanged: (value) {
                      setState(() {
                        _selectedMedicion = value!;
                      });
                      widget.onMeasurementChanged(value!);
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
