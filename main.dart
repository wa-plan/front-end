import 'package:flutter/material.dart';
import 'package:flutter_application_1/settings/settings_main.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter_application_1/todayDomino/widgets/nav_bar.dart';

import 'package:flutter_application_1/todayDomino/widgets/old_event_calendar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/date_provider.dart';

void main() async {
  await initializeDateFormatting();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DateProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
        title: 'TDYdomino', debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

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
        body: Column(children: [
          const Expanded(
            child: OldEventCalendar(),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsMain(),
                    ));
              },
              child: const Text('설정', style: TextStyle(color: Colors.white))),
        ]),
        bottomNavigationBar: const NavBar());
  }
}
