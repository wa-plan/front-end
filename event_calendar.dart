import 'package:flutter/material.dart';
import 'package:flutter_application_1/todayDomino/repository/db_helper.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection'; //LinkedHashMap 객체 사용하기 위한 라이브러리
import 'package:flutter_application_1/todayDomino/pages/add_page1.dart';
import 'package:flutter_application_1/todayDomino/pages/edit_page.dart';

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
  //DateTime pickedDate = AddCalendarState().pickedDate;

  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();

    // _selectedEvents 초기화
    //_selectedEvents = ValueNotifier([]);

    // 데이터베이스에서 Domino 객체들을 가져와서 이벤트로 변환하여 추가
    _addDominosToEvents();

    //_EventSourceFromDatabase();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));

    // dominos 필드를 초기화합니다.
    dominos = dbHelper.getDominos();
  }

  Future<void> _addDominosToEvents() async {
    List<Domino> dominos = await dbHelper.getDominos();
    //List<Event> events = [];

    for (var domino in dominos) {
      // Domino 객체를 Event 객체로 변환하여 event 리스트에 추가
      Event event = Event(domino);
      //events.add(event);
      _addEventForDay(domino.date, event);
    }

    // _selectedEvents 업데이트
    //_selectedEvents.value = events;
  }

  void _addEventForDay(DateTime day, Event event) {
    // 해당 날짜의 이벤트 목록 가져오기
    List<Event> events = _kEventSource[day] ?? [];
    // 이벤트 추가
    events.add(event);
    // 이벤트 목록 업데이트
    _kEventSource[day] = events;
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return _kEventSource[day] ?? [];
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
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
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
            //ValueNotifier의 값이 변경될 때마다 자신의 'builder' 콜백을 호출한다.
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
                return FutureBuilder<void>(
                  future: dominos,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); //대기중일 때, 로딩 애니메이션
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); //에러가 발생하는 경우, 에러명이 텍스트로 보임
                    } else {
                      //데이터를 정상적으로 받아온 경우
                      //List<Domino> dominoList = snapshot.data as List<Domino>;
                      //List<Domino> dominos = snapshot.data!;
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            '${value[index]}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                          const SizedBox(
                                            width: 5,
                                          ),
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
                                          const SizedBox(
                                            width: 5,
                                          ),
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
                              onLongPress: () => editDialog(
                                  context, value[index].domino.content));
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
  final Domino domino;
  bool didZero, didHalf, didAll; // 버튼 상태를 저장하는 필드 추가

  Event(
    this.domino, {
    this.didZero = false,
    this.didHalf = false,
    this.didAll = false,
  }); // {중괄호} 안의 인자는 선택적 매개변수로 기본값을 설정할 수 있다.
  // 선택적 매개변수의 값을 지정하지 않으면 기본값이 사용됨

  @override
  String toString() => domino.content;
}

/*final kEvents = LinkedHashMap<DateTime, List<Event>>(
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
  });*/

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = <DateTime, List<Event>>{};

void _addDominoToKEventSource(Domino domino) {
  final event = Event(domino);
  final eventList = _kEventSource[domino.date] ?? [];
  eventList.add(event);
  _kEventSource[domino.date] = eventList;
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

Future<void> _EventSourceFromDatabase() async {
  final List<Domino> dominos = await dbHelper.getDominos();
  for (final domino in dominos) {
    _addDominoToKEventSource(domino);
  }
}

final kToday = DateTime.now();

void editDialog(BuildContext context, String content) {
  showDialog(
      context: context,
      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        return AlertDialog(
          //title: const Text('팝업 메시지'),
          backgroundColor: const Color(0xff262626),

          content: Row(
            children: [
              Container(
                width: 15,
                height: 140,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(3))),
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '환상적인 세계여행',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Money',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 80,
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
                  Text(
                    content,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Container(
                      height: 1,
                      width: 200,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    '반복',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Text(
                    '매월 목요일',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
