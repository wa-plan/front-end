import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class WeekCalendar extends StatefulWidget {
  const WeekCalendar({Key? key}) : super(key: key);
  

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {



  @override
  Widget build(BuildContext context) {
    return TableCalendar(
            calendarFormat: CalendarFormat.week,

            locale: 'ko-KR',    //한국어 설정
            
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
              leftChevronIcon: Icon(null),
              rightChevronIcon: Icon(null),
            ),

            focusedDay: DateTime.now(), 
            firstDay: DateTime.utc(2014,1,1), 
            lastDay: DateTime.utc(2034,12,31),
            );
  }
}