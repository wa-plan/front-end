import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_page1.dart';
import 'package:flutter_application_1/repository/db_helper.dart';
import 'package:flutter_application_1/widgets/add_calendar.dart';
import 'package:flutter_application_1/widgets/repeat_settings.dart';
import 'package:flutter_application_1/main.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool switchValue = false;
  final formKey = GlobalKey<FormState>();
  String dominoValue = '';
  late DateTime pickedDate;
  //final DatabaseHelper dbHelper = DatabaseHelper();
  late final DatabaseHelper dbHelper =
      DatabaseHelper(); // dbHelper를 선언과 동시에 초기화
  late Future<List<Domino>> dominos;
  TextEditingController dominoController =
      TextEditingController(text: "저금"); //텍스트폼필드에 기본으로 들어갈 초기 텍스트 값

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
    pickedDate = AddCalendarState().pickedDate;
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
            '도미노 수정하기',
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
              const AddCalendar(),
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
                      Navigator.pushReplacement(
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
                )
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
