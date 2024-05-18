import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_application_1/todayDomino/widgets/repeat_settings.dart';

class AddCalendar extends StatefulWidget {
  const AddCalendar({Key? key}) : super(key: key);

  @override
  State<AddCalendar> createState() => AddCalendarState();
}

class AddCalendarState extends State<AddCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late DateTime pickedDate = DateTime.now(); //도미노로 저장할 때, 해당 페이지로 넘길 날짜 변수
  RepeatSettingsState repeatSettings =
      RepeatSettingsState(); // RepeatSettingsState 인스턴스 생성
  final GlobalKey<RepeatSettingsState> repeatSettingsKey = GlobalKey();

  DateTime getPickedDate() {
    return pickedDate;
  }

  @override
  void initState() {
    super.initState();
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

                //bool everyDay = repeatSettingsKey.currentState!.everyDay;
                /*bool everyDay = repeatSettings.everyDay;
                if (everyDay) {
                  _selectedDay = selectedDay.add(const Duration(days: 1));
                }*/
              });
              //bool repeatChoice = repeatSettingsKey.currentState!.repeatChoice();
              //bool everyDay = repeatSettingsKey.currentState!.everyDay;
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
