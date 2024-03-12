import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/db_helper.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection'; //LinkedHashMap 객체 사용하기 위한 라이브러리
import 'package:flutter_application_1/pages/add_page1.dart';
import 'package:flutter_application_1/pages/edit_page.dart';

final DatabaseHelper dbHelper = DatabaseHelper();

class EventCalendar extends StatefulWidget {
  const EventCalendar({Key? key}) : super(key: key);

  @override
  State<EventCalendar> createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  late Future<List<Domino>> dominos;

  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));

    // 데이터베이스에서 Domino 객체들을 가져와서 이벤트로 변환하여 추가
    _addDominosToEvents();

    // dominos 필드를 초기화합니다.
    dominos = dbHelper.getDominos();
  }

  Future<void> _addDominosToEvents() async {
    List<Domino> dominos = await dbHelper.getDominos();
    for (var domino in dominos) {
      // Domino 객체를 Event 객체로 변환하여 event 리스트에 추가
      Event event = Event(domino.content);
      _addEventForDay(domino.date, event);
    }
  }

  void _addEventForDay(DateTime day, Event event) {
    // 해당 날짜의 이벤트 목록 가져오기
    List<Event> events = kEvents[day] ?? [];
    // 이벤트 추가
    events.add(event);
    // 이벤트 목록 업데이트
    kEvents[day] = events;
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar<Event>(
          firstDay: DateTime.utc(2014, 1, 1),
          lastDay: DateTime.utc(2034, 12, 31),
          focusedDay: _focusedDay,
          eventLoader: _getEventsForDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: _onDaySelected,
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          availableCalendarFormats: const {
            CalendarFormat.month: '한달',
            CalendarFormat.week: '1주',
          },
          locale: 'ko-KR',
          calendarStyle: CalendarStyle(
              markerSize: 0.0,
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
              leftChevronMargin: EdgeInsets.only(right: 55.0),
              //formatButtonVisible: false,
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
        ),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * (6 / 7)),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddPage1(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff262626),
                elevation: 0.0,
              ),
              icon: const Icon(Icons.add, color: Color(0xff5C5C5C), size: 30),
              alignment: Alignment.centerRight,
            ), //루틴 추가하기 아이콘
          ],
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              if (value.isEmpty) {
                // 이벤트가 없는 경우
                return const Center(
                  child: Column(
                    children: [
                      Text(
                        '오늘은 도미노가 없네요.',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5C5C5C),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '여유를 가져도 되겠어요:)',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff5C5C5C),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              } else {
                // 이벤트가 있는 경우
                return FutureBuilder(
                  future: dominos,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      //List<Domino> dominoList = snapshot.data as List<Domino>;
                      return Expanded(
                          child: ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                                height: 70,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 4.0,
                                ),
                                /*decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12.0),
                                                    ),*/

                                child: Row(
                                  children: [
                                    Container(
                                      width: 22,
                                      height: 55,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Money',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          '${value[index]}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                value[index].didZero = !value[
                                                        index]
                                                    .didZero; // 해당 Event 객체의 버튼 상태 변경
                                                value[index].didHalf = false;
                                                value[index].didAll = false;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.clear_outlined,
                                              color: value[index].didZero
                                                  ? Colors.yellow
                                                  : const Color(0xff5C5C5C),
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                value[index].didHalf = !value[
                                                        index]
                                                    .didHalf; // 해당 Event 객체의 버튼 상태 변경
                                                value[index].didZero = false;
                                                value[index].didAll = false;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.change_history_outlined,
                                              color: value[index].didHalf
                                                  ? Colors.yellow
                                                  : const Color(0xff5C5C5C),
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                value[index].didAll = !value[
                                                        index]
                                                    .didAll; // 해당 Event 객체의 버튼 상태 변경
                                                value[index].didZero = false;
                                                value[index].didHalf = false;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.circle_outlined,
                                              color: value[index].didAll
                                                  ? Colors.yellow
                                                  : const Color(0xff5C5C5C),
                                            )),
                                      ],
                                    )
                                  ],
                                )),
                            onLongPress: () => editDialog(context),
                          );
                        },
                      ));
                    }
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class Event {
  final String title;
  bool didZero, didHalf, didAll; // 버튼 상태를 저장하는 필드 추가

  Event(
    this.title, {
    this.didZero = false,
    this.didHalf = false,
    this.didAll = false,
  }); // {중괄호} 안의 인자는 선택적 매개변수로 기본값을 설정할 수 있다.
  // 선택적 매개변수의 값을 지정하지 않으면 기본값이 사용됨

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}'))
}..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });
int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

void editDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        return AlertDialog(
          //title: const Text('팝업 메시지'),
          backgroundColor: const Color(0xff262626),
          content: Row(
            children: [
              /*Container(
                width: 10,
                height: 80,
                decoration: const BoxDecoration(color: Colors.red),
              ),*/
              const Column(
                children: [
                  Text('환상적인 세계여행'),
                  Text('Money'),
                  Text('40만원 저금'),
                  Text('반복'),
                  Text('매월 목요일'),
                ],
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditPage(),
                        ));
                  },
                  icon: const Icon(Icons.edit))
            ],
          ),
          /*content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Alert Dialog 테스트'),
                Text('ok 버튼 클릭하세요'),
              ],
            ),
          ),*/
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
