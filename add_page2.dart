import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_page1.dart';
import 'package:flutter_application_1/widgets/add_calendar.dart';
import 'package:flutter_application_1/widgets/repeat_settings.dart';

class AddPage2 extends StatefulWidget {
  const AddPage2({super.key});

  @override
  State<AddPage2> createState() => _AddPage2State();
}

class _AddPage2State extends State<AddPage2> {
  bool switchValue=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Text('도미노 만들기',
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontWeight: FontWeight.w600
            ),
          ),
      ),
    backgroundColor:const Color(0xff262626),
    ),
    backgroundColor: const Color(0xff262626),
    
    body: Padding(
      padding: const EdgeInsets.fromLTRB(38.0, 30.0, 40.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('더 자세하게 바꿀 수 있어요.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1
          ),
          ),
          const Text('예시) 영어 공부 > 영단어 5개 암기',
          style: TextStyle(
            color: Color(0xffF6C92B),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1
          ),
          ),


          const SizedBox(
            height: 20,),
          
          const TextField(
            style: TextStyle(
              fontSize: 16,
              color: Colors.white),
            decoration: InputDecoration(
              
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.close,
              ),
                
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          const Text('언제 실행하고 싶나요?', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold
          ),),            

          AddCalendar(),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,         //오른쪽 정렬
            children: [
              const Text('반복하기',
              style: TextStyle(
                color: Colors.white
              ),),
              const SizedBox(width: 10),
              Switch(
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  }
                  );
                },
                ),
            ],
          ),

          if (switchValue) const RepeatSettings(),
          

          Row(
            children: [
              TextButton(
                onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const AddPage1(),)
                        );
                    }, 
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff131313),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0)
                  )
                ),
                child: const Text('이전',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
                
              ),//취소 버튼


          TextButton(     //임의버튼(만다라트 대용버튼)
              onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const AddPage2(),)
                      );
                  }, 
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff131313),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)
                )
              ),
              child: const Text('완료',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),
              ),
              
            )
          ]
          )


        ],
      ),
    ),
    );
  }
}