import 'package:flutter/material.dart';

class RepeatSettings extends StatefulWidget {
  const RepeatSettings({super.key});

  @override
  State<RepeatSettings> createState() => _RepeatSettingsState();
}

class _RepeatSettingsState extends State<RepeatSettings> {
  
  bool everyDay=false;  
  bool everyWeek=false;   
  bool everyTwoWeek=false;
  bool everyMonth=false;    //변수: 체크박스 체크 여부
 
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(width: 1.5,color: Colors.white)),   //체크박스 테두리의 두께와 색깔 지정
          activeColor: const Color(0xff262626),
          checkColor: const Color(0xffFF6767),
          value: everyDay,
          onChanged: (value) {
            setState(() {
              everyDay=value!;
              everyWeek=false;
              everyTwoWeek=false;
              everyMonth=false;
            });
          },
          ),
          const Text('매일',
          style: TextStyle(
            color: Colors.white
          ),),



          Checkbox(
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(width: 1.5,color: Colors.white)),   //체크박스 테두리의 두께와 색깔 지정
          activeColor: const Color(0xff262626),
          checkColor: const Color(0xffFF6767),
          value: everyWeek,
          onChanged: (value) {
            setState(() {
              everyWeek=value!;
              everyDay=false;
              everyTwoWeek=false;
              everyMonth=false;
            });
          },
          ),
          const Text('매주',
          style: TextStyle(
            color: Colors.white
          ),),



          Checkbox(
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(width: 1.5,color: Colors.white)),   //체크박스 테두리의 두께와 색깔 지정
          activeColor: const Color(0xff262626),
          checkColor: const Color(0xffFF6767),
          value: everyTwoWeek,
          onChanged: (value) {
            setState(() {
              everyTwoWeek=value!;
              everyDay=false;
              everyWeek=false;
              everyMonth=false;
            });
          },
          ),
          const Text('격주',
          style: TextStyle(
            color: Colors.white
          ),),



          Checkbox(
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(width: 1.5,color: Colors.white)),   //체크박스 테두리의 두께와 색깔 지정
          activeColor: const Color(0xff262626),
          checkColor: const Color(0xffFF6767),
          value: everyMonth,
          onChanged: (value) {
            setState(() {
              everyMonth=value!;
              everyDay=false;
              everyWeek=false;
              everyTwoWeek=false;
            });
          },
          ),
          const Text('매월',
          style: TextStyle(
            color: Colors.white
          ),),

      ],
    );
  }
}