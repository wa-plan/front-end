import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:intl/date_symbol_data_local.dart';

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({Key? key}) : super(key: key);

  @override
  State<WeekCalendar> createState() => _MyTableCalendarState();
}

class _MyTableCalendarState extends State<WeekCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: TableCalendar(
              locale: 'ko-KR',
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextStyle: TextStyle(color: Colors.white),
              ),
              calendarStyle: CalendarStyle(
                weekendTextStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: Colors.white,
                ),
                defaultTextStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
