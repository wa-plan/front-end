import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class AddCalendar extends StatefulWidget {
  const AddCalendar({Key? key}) : super(key: key);

  @override
  State<AddCalendar> createState() => AddCalendarState();
}


class AddCalendarState extends State<AddCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;


  @override
  Widget build(BuildContext context) {
    return TableCalendar(
            locale: 'ko-KR',

            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },

            calendarFormat: CalendarFormat.month,


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
            
            
            firstDay: DateTime.utc(2014,1,1), 
            lastDay: DateTime.utc(2034,12,31),
            
            
            


            
            );


            


  }
}