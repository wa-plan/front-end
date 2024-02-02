import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:intl/date_symbol_data_local.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar({Key? key}) : super(key: key);

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  CalendarFormat calFormat = CalendarFormat.month;
  DateTime focusingDay = DateTime.now();
  DateTime? selectingDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
            locale: 'ko-KR',

            selectedDayPredicate: (day) {
              return isSameDay(selectingDay, day);
            },
            
            onDaySelected: (selectedDay, focusedDay) {
               if (!isSameDay(selectingDay, selectedDay)) {
                setState(() {
                  selectingDay = selectedDay;
                  focusingDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (calFormat != format) {
                setState(() {
                  calFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
             focusingDay = focusedDay;
            },
          


            calendarStyle: CalendarStyle(

              isTodayHighlighted: true,
              todayDecoration: const BoxDecoration(
                color: Color(0xFF5B5B5B),
                shape: BoxShape.circle
              ),
              
              
              selectedDecoration: const BoxDecoration(
                color: Color(0xFFFF6767),
                shape: BoxShape.rectangle
              ),

              defaultTextStyle: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.035,
              ),
              weekendTextStyle: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.035,
              )
            ),        
          
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                color: Colors.white
              ),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ),
            
            focusedDay: DateTime.now(), 
            firstDay: DateTime.utc(2014,1,1), 
            lastDay: DateTime.utc(2034,12,31),
            );
  }
}