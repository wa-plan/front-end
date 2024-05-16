import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dominoplan/model.dart';

class DPcreateInput1Page extends StatelessWidget {
  const DPcreateInput1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff262626),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff262626),
        title: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Text(
              '플랜 만들기',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.w600),
            ),
          ),
      ),

      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.fromLTRB(38.0, 30.0, 40.0, 0.0),
        child: Column(
          children: [

            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
              "목표를 이루기 위한 \n작은 계획들을 세워봐요.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.1
              )
            )),

            const SizedBox(height: 20,),

            Container(
              height: 43,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xffFCFF62)
              ),
              child: Text(
                context.watch<SelectFinalGoalModel>().selectedFinalGoal,
                style: const TextStyle(
                color: Colors.black,
                fontSize:13,
                fontWeight: FontWeight.bold,))
              ),

              const SizedBox(height: 20,),

              SizedBox(
                height: 300,
                width: 260,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  children: [

                    Container(
                      width: 80,
                      color: const Color(0xff5C5C5C) ,
                      margin: const EdgeInsets.all(1.0),
                      child: TextField(
                        onChanged:(value) {
                          context.read<SaveInputtedDetailGoalModel>().inputtedDetailGoal['0']=value;
                        },
                      )
                    ),

                    Container(
                      width: 80,
                      color: const Color(0xff5C5C5C) ,
                      margin: const EdgeInsets.all(1.0),
                      child: TextField(
                        onChanged:(value) {
                          context.read<SaveInputtedDetailGoalModel>().inputtedDetailGoal['1']=value;
                        },
                      )
                    ),

                    Container(
                      width: 80,
                      color: const Color(0xff5C5C5C) ,
                      margin: const EdgeInsets.all(1.0),
                      child: TextField(
                        onChanged:(value) {
                          context.read<SaveInputtedDetailGoalModel>().inputtedDetailGoal['2']=value;
                        },
                      )
                    ),

                    Container(
                      width: 80,
                      color: const Color(0xff5C5C5C) ,
                      margin: const EdgeInsets.all(1.0),
                      child: TextField(
                        onChanged:(value) {
                          context.read<SaveInputtedDetailGoalModel>().inputtedDetailGoal['3']=value;
                        },
                      )
                    ), 

                  Container(
                        width:80,
                        color: const Color(0xffFCFF62),
                        margin: const EdgeInsets.all(1.0),
                        child:Text(
                          context.watch<SelectFinalGoalModel>().selectedFinalGoal,
                          style: const TextStyle(color:Colors.black, fontSize: 15, fontWeight:FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                 
                    Container(
                      width: 80,
                      color: const Color(0xff5C5C5C) ,
                      margin: const EdgeInsets.all(1.0),
                      child: TextField(
                        onChanged:(value) {
                          context.read<SaveInputtedDetailGoalModel>().inputtedDetailGoal['5']=value;
                        },
                      )
                    ),

                    Container(
                      width: 80,
                      color: const Color(0xff5C5C5C) ,
                      margin: const EdgeInsets.all(1.0),
                      child: TextField(
                        onChanged:(value) {
                          context.read<SaveInputtedDetailGoalModel>().inputtedDetailGoal['6']=value;
                        },
                      )
                    ),

                    Container(
                      width: 80,
                      color: const Color(0xff5C5C5C) ,
                      margin: const EdgeInsets.all(1.0),
                      child: TextField(
                        onChanged:(value) {
                          context.read<SaveInputtedDetailGoalModel>().inputtedDetailGoal['7']=value;
                        },
                      )
                    ),

                    Container(
                      width: 80,
                      color: const Color(0xff5C5C5C) ,
                      margin: const EdgeInsets.all(1.0),
                      child: TextField(
                        onChanged:(value) {
                          context.read<SaveInputtedDetailGoalModel>().inputtedDetailGoal['8']=value;
                        },
                      )
                    ),

                  ]
                )),

                const SizedBox(height: 20,),

                const Text(
                  '모든 칸을 다 채우지 않아도 괜찮아요.',
                  style: TextStyle(color: Colors.white),
                ),

                 TextButton(
                  onPressed: () {
                        Navigator.pop(context);
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

            
          ],
        )
      )
      ));
  }
}

