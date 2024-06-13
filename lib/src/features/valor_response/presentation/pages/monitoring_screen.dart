import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:app_plataforma/src/features/valor_response/presentation/bloc/valor_response_bloc.dart';
import 'package:app_plataforma/src/features/valor_response/presentation/widgets/table_calendar.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// <>
class MonitoringScreen extends StatefulWidget {

  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();

}

class _MonitoringScreenState extends State<MonitoringScreen>{

  DateTime today = DateTime.now();
  DateTime? selectedDate = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = selectedDay;
      today = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    String formattedSelectedDate = selectedDate != null
        ? DateFormat('EEEE, d MMMM, y', 'es_ES').format(selectedDate!)
        : DateFormat('EEEE, d MMMM, y', 'es_ES').format(today);

    String formattedDate = selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(selectedDate!)
        : DateFormat('yyyy-MM-dd').format(today);

    return BlocProvider<ValorResponseBloc>(
      create: (context) => sl<ValorResponseBloc>()
        ..add(GetListValoresGlucosa(fecha: formattedDate))
        ..add(GetListValoresPresion(fecha: formattedDate)),
      child: Scaffold(
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              TableCalendarWidget(
                today: today,
                selectedDate: selectedDate,
                onDaySelected: _onDaySelected,
              ),
              Text(formattedDate)
            ],
          ),
        ),
      )
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
