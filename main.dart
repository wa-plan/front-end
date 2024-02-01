import 'package:flutter/material.dart';
import 'widgets/week_calender.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TDYdomino',
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오늘의 도미노',
        style: TextStyle(color: Colors.white,
        ),
        ),
        backgroundColor: Colors.black,
        ),
      backgroundColor: Colors.red,
      body: 
      SingleChildScrollView(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          ),   
          WeekCalendar()
          /*Expanded(
            child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            availableCalendarFormats: const {
              CalendarFormat.month: '월',
              CalendarFormat.week: '주',
              },
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
          ),*/
          ],
        ),
      
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: '나의 목표',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: '도미노 플랜',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '오늘의 도미노',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
      ),
    );
  }
}
