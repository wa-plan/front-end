import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/date_provider.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_application_1/todayDomino/widgets/event_calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_application_1/todayDomino/widgets/repeat_settings.dart';

class AddCalendar extends StatefulWidget {
  const AddCalendar({Key? key}) : super(key: key);
  @override
  State<AddCalendar> createState() => AddCalendarState();
}

class AddCalendarState extends State<AddCalendar> {
  late DateProvider _dateProvider;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late DateTime pickedDate = DateTime.now(); //도미노로 저장할 때, 해당 페이지로 넘길 날짜 변수
  RepeatSettingsState repeatSettings =
      RepeatSettingsState(); // RepeatSettingsState 인스턴스 생성
  final GlobalKey<RepeatSettingsState> repeatSettingsKey = GlobalKey();
  Map pickDates = {};

  @override
  void initState() {
    super.initState();
    _dateProvider = Provider.of<DateProvider>(context, listen: false);
    pickedDate = _focusedDay; // 초기에는 현재 날짜로 설정
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          locale: 'ko-KR',
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              // Call `setState()` when updating the selected day
              //bool everyDay = repeatSettingsKey.currentState!.everyDay;
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                pickedDate = selectedDay;
                _dateProvider.pick();
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          calendarFormat: CalendarFormat.month,
          calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              isTodayHighlighted: true,
              todayDecoration: const BoxDecoration(
                  color: Color(0xFF5B5B5B), shape: BoxShape.circle),
              selectedDecoration: const BoxDecoration(
                  color: Color(0xFFFF6767), shape: BoxShape.rectangle),
              defaultTextStyle: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.035,
              ),
              weekendTextStyle: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.035,
              )),
          headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(color: Colors.white),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )),
          firstDay: DateTime.utc(2014, 1, 1),
          lastDay: DateTime.utc(2034, 12, 31),
        ),
        Text(
          '$pickedDate',
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

/*table calendar 이벤트 load 할 때 참고하기
class Event {
  final DateTime date;
  final String content;
  Event({required this.date, required this.content});
}

final _events = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll({
    DateTime(2024, 6, 21): [
      Event(date: DateTime(2024, 6, 21), content: "It's event1")
    ],
  });

List<Event> _getEventsForDay(DateTime day) {
  return _events[day] ?? [];
}*/
