import 'package:flutter/material.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widgets/nav_bar.dart';


class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String selectedGoal='';


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
          const Text('어떤 목표를 달성하기 위한 \n도미노인가요?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1
          ),
          ),
          const SizedBox(
            height: 20,),
          Container(
            height: 43,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: const Color(0xff5C5C5C),
                
              )
            ),

            child: DropdownButton(
              value: selectedGoal,
              items: const [
                DropdownMenuItem(
                  value: 'Goal.1',
                  child: Text('환상적인 세계 여행')),
                DropdownMenuItem(
                  value: 'Goal.2',
                  child: Text('2023년 1학기 올A')),
                  DropdownMenuItem(
                  value: 'Goal.3',
                  child: Text('10kg 감량하기')),
              ], 
              onChanged: (value) {
                setState(() {
                  selectedGoal=value!;
                });
              },
              isExpanded: true,
              dropdownColor: const Color(0xff262626),
              style: const TextStyle(
                color: Colors.white
              ),
              iconEnabledColor: Colors.white,
              underline: Container(),
              

              ),
          ),

          SizedBox(
            height: 510,
          ),

          TextButton(
            onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const MyApp(),)
                    );
                }, 
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff131313),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)
              )
            ),
            child: const Text('취소',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),
            ),
            
          )     //취소 버튼

        ],
      ),
    ),
    bottomNavigationBar: const NavBar(),

    );
  }
}