import 'package:app_plataforma/src/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarWidget extends StatefulWidget{

  final DateTime today;
  final DateTime? selectedDate;
  final void Function(DateTime, DateTime) onDaySelected;

  const TableCalendarWidget({
    super.key,
    required this.today,
    this.selectedDate,
    required this.onDaySelected,
  });

  @override
  State<TableCalendarWidget> createState() => _TableCalendarState();

}

class _TableCalendarState extends State<TableCalendarWidget> {

  DateTime today = DateTime.now();
  DateTime? selectedDate;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  void _onFormatChanged(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final colorScheme = Theme.of(context).colorScheme;

    return TableCalendar(
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: AppTextStyles.bodyStyle(color: colorScheme.primary, size: height*0.025),
        headerPadding: const EdgeInsets.symmetric(vertical: 0),
      ),
      locale: 'es',
      focusedDay: widget.today,
      onDaySelected: (selectedDay, focusedDay) {
        widget.onDaySelected(selectedDay, focusedDay);
      },
      onFormatChanged: _onFormatChanged,
      calendarFormat: _calendarFormat,
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (dia) => isSameDay(dia, widget.today),
      firstDay: DateTime.utc(2000, 01, 01),
      lastDay: DateTime.utc(3000, 12, 31),
      rowHeight: height * 0.07,
      calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: colorScheme.primary,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.6),
              shape: BoxShape.circle
          ),
          outsideDaysVisible: false,
          weekendTextStyle: AppTextStyles.bodyStyle(color: colorScheme.onBackground, size: height*0.02),
          defaultTextStyle: AppTextStyles.bodyStyle(color: colorScheme.onBackground, size: height*0.02)
      ),
      daysOfWeekHeight: height*0.05,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: AppTextStyles.titleStyle(color: Colors.grey, size: height*0.02),
        weekendStyle: AppTextStyles.titleStyle(color: Colors.grey, size: height*0.02),
      ),
    );
  }
}
