import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter_application_1/widgets/nav_bar.dart';

import 'package:flutter_application_1/widgets/event_calendar.dart';

void main() async {
  await initializeDateFormatting();
  runApp(const MyApp());
}

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Text(
              '오늘의 도미노',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: const Color(0xff262626),
        ),
        backgroundColor: const Color(0xff262626),
        body: const Column(children: [
          Expanded(
            child: EventCalendar(),
          ),
        ]),
        bottomNavigationBar: const NavBar());
  }
}
