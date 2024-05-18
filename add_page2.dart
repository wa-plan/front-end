import 'package:flutter/material.dart';
import 'package:flutter_application_1/todayDomino/pages/add_page1.dart';
import 'package:flutter_application_1/todayDomino/repository/db_helper.dart';
//import 'package:flutter_application_1/widgets/add_calendar.dart';
import 'package:flutter_application_1/todayDomino/widgets/repeat_settings.dart';
import 'package:flutter_application_1/main.dart';
import 'package:table_calendar/table_calendar.dart';

class AddPage2 extends StatefulWidget {
  const AddPage2({super.key});

  @override
  State<AddPage2> createState() => _AddPage2State();
}

class _AddPage2State extends State<AddPage2> {
  bool switchValue = false;
  final formKey = GlobalKey<FormState>();
  String dominoValue = '';
  late DateTime pickedDate = DateTime.now();
  //final DatabaseHelper dbHelper = DatabaseHelper();
  late final DatabaseHelper dbHelper =
      DatabaseHelper(); // dbHelper를 선언과 동시에 초기화
  late Future<List<Domino>> dominos;
  TextEditingController dominoController =
      TextEditingController(text: "저금"); //텍스트폼필드에 기본으로 들어갈 초기 텍스트 값

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  RepeatSettingsState repeatSettings =
      RepeatSettingsState(); // RepeatSettingsState 인스턴스 생성

  DateTime getPickedDate() {
    return pickedDate;
  }

  //텍스트폼필드 함수 만들기
  renderTextFormField({
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
  }) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      controller: dominoController,
      style: const TextStyle(fontSize: 16, color: Colors.white),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: dominoController.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  dominoController.clear();
                },
                icon: const Icon(Icons.clear_outlined),
              )
            : null,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dominos = dbHelper.getDominos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Text(
            '도미노 만들기',
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: const Color(0xff262626),
      ),
      backgroundColor: const Color(0xff262626),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(38.0, 30.0, 40.0, 0.0),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '더 자세하게 바꿀 수 있어요.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1),
              ),
              const Text(
                '예시) 영어 공부 > 영단어 5개 암기',
                style: TextStyle(
                    color: Color(0xffF6C92B),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: renderTextFormField(
                  onSaved: (value) {
                    setState(() {
                      dominoValue = value;
                    });
                  },
                  validator: (value) {
                    if (value.length < 1) {
                      return '1자 이상 써주세요';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '언제 실행하고 싶나요?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
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
              //const AddCalendar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, //오른쪽 정렬
                children: [
                  const Text(
                    '반복하기',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Switch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ],
              ),
              if (switchValue) const RepeatSettings(),
              Row(children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddPage1(),
                        ));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff131313),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0))),
                  child: const Text(
                    '이전',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ), //취소 버튼

                TextButton(
                  //임의버튼(만다라트 대용버튼)
                  onPressed: () async {
                    String content =
                        dominoController.text; // 텍스트 필드에서 입력된 내용을 가져옴
                    if (formKey.currentState!.validate()) {
                      await dbHelper.insertDomino(
                          Domino(date: pickedDate, content: content));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            //builder: (context) => MainAddedPage(dominoValue),
                            builder: (context) => const MyApp(),
                          ));
                      formKey.currentState!.save();
                    }
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff131313),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0))),
                  child: const Text(
                    '완료',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),

                ElevatedButton(
                    //onPressed: dbHelper.deleteAllDominos,
                    onPressed: () {
                      dbHelper.deleteAllDominos();
                    },
                    child: const Text('도미노 모두 삭제'))
              ]),
            ],
          ),
        ]),
      ),
    );
  }

  void _editDomino(BuildContext context, Domino domino) {
    BuildContext context = this.context; // BuildContext 저장
    dominoController.text = domino.content;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Domino'),
          content: TextField(
            controller: dominoController,
            decoration:
                const InputDecoration(hintText: 'Enter your edited todo'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                String content = dominoController.text;
                if (content.isNotEmpty) {
                  domino.content = content;
                  await dbHelper.updateDomino(domino);
                  Navigator.pop(context);
                  setState(() {
                    dominos = dbHelper.getDominos();
                  });
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteDomino(BuildContext context, Domino domino) {
    BuildContext context = this.context; // BuildContext 저장
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Todo'),
          content: const Text('Are you sure you want to delete this todo?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await dbHelper.deleteDomino(domino.id);
                Navigator.pop(context);
                setState(() {
                  dominos = dbHelper.getDominos();
                });
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
