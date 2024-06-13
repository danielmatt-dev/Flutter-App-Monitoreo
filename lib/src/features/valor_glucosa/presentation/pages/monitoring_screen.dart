import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/valor_glucosa/presentation/widgets/table_calendar.dart';
import 'package:flutter/material.dart';

// <>
class MonitoringScreen extends StatefulWidget {

  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();

}

class _MonitoringScreenState extends State<MonitoringScreen>{

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppTextStyles.autoBodyStyle(
              text: 'Calendario de mediciones',
              color: colorScheme.primary,
              height: height,
              maxLines: 1,
              percent: 0.03
          ),
        backgroundColor: colorScheme.background,
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            TableCalendarWidget()
          ],
        ),
      ),
    );

  }

}

Widget _levels({
  required double height,
  required List<String> categories,
  required Color textColor,
}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      _level(height: height, textColor: textColor, color: Colors.green, text: categories[0]),
      const SizedBox(width: 10,),
      _level(height: height, textColor: textColor, color: Colors.yellow, text: categories[1]),
      const SizedBox(width: 10,),
      _level(height: height, textColor: textColor, color: Colors.red, text: categories[2]),
      const SizedBox(width: 10,),
    ],
  );
}

Widget _level({
  required double height,
  required Color textColor,
  required Color color,
  required String text
}) {
  return Row(
      children: [
        CircleAvatar(
          radius: 7,
          backgroundColor: color,
        ),
        const SizedBox(width: 3),
        AppTextStyles.autoBodyStyle(
            text: text,
            maxLines: 1,
            height: height,
            percent: 0.02,
            color: textColor
        ),
      ]
  );
}
