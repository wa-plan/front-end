import 'package:flutter/material.dart';
//import 'package:flutter_application_1/widgets/week_calender.dart';
//import 'package:flutter_application_1/widgets/month_calender.dart';
import 'package:intl/date_symbol_data_local.dart';

//import 'package:table_calendar/table_calendar.dart';

import 'widgets/month_calendar.dart';
import 'widgets/week_calendar.dart';

void main() async {
  await initializeDateFormatting(); 
  runApp(const MyApp());}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TDYdomino',
      debugShowCheckedModeBanner: false,
      home: Grade(),
    );
  }
}



class Grade extends StatefulWidget {
  const Grade({super.key});

  @override
  State<Grade> createState() => _GradeState();
}

class _GradeState extends State<Grade> {
  bool isWeekCalendarVisible=true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Text('오늘의 도미노',
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontWeight: FontWeight.w600
          ),
          ),
        ),
      backgroundColor:const Color(0xff262626),
        ),
      backgroundColor: const Color(0xff262626),


      body: Column(
        children: [
          if (isWeekCalendarVisible) const WeekCalendar(),
          if (!isWeekCalendarVisible) const MonthCalendar(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isWeekCalendarVisible = !isWeekCalendarVisible;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff262626),
              elevation: 0.0,   //버튼을 위 아이콘 또는 아래 아이콘으로 바꾸기
            ),
            child: Icon(isWeekCalendarVisible ? Icons.arrow_drop_down : Icons.arrow_drop_up,
            color: Colors.white), 
            
          )
        ],
      ),
      );
  }
}