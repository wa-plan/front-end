import 'package:dominoplan/pages/DPcreateConfirmPage.dart';
import 'package:dominoplan/pages/DPcreateInput1Page.dart';
import 'package:dominoplan/pages/DPcreateInput2Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dominoplan/model.dart';

class DPcreate99Page extends StatelessWidget {
  const DPcreate99Page({super.key});

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

      body: Padding(
        padding: const EdgeInsets.fromLTRB(38.0, 30.0, 40.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text('목표를 이루기 위한 \n작은 계획들을 세워봐요.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1
                            ),
                  ),

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

            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                children: [

                  GestureDetector(
                    onTap: () {
                        context.read<SelectDetailGoal>().selectDetailGoal('0');
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const DPcreateInput2Page(),)
                          );
                      },
                    child: SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[0];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';

                        if (index == 4) {
                            return Container(
                              color: const Color(0xff929292),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['0'],
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {

                            return Container(
                              color: const Color(0xff5C5C5C),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                values.toString(),
                                style: const TextStyle(color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                      })
                    )
                  ),),

                  GestureDetector(
                    onTap: () {
                        context.read<SelectDetailGoal>().selectDetailGoal('1');
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const DPcreateInput2Page(),)
                          );
                      },
                    child: SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[1];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';

                        if (index == 4) {
                            return Container(
                              color: const Color(0xff929292),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['1'],
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {

                            return Container(
                              color: const Color(0xff5C5C5C),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                values.toString(),
                                style: const TextStyle(color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                      })
                    )
                  ),),

                  GestureDetector(
                    onTap: () {
                        context.read<SelectDetailGoal>().selectDetailGoal('2');
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const DPcreateInput2Page(),)
                          );
                      },
                    child: SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[2];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';

                        if (index == 4) {
                            return Container(
                              color: const Color(0xff929292),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['2'],
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {

                            return Container(
                              color: const Color(0xff5C5C5C),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                values.toString(),
                                style: const TextStyle(color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                      })
                    )
                  ),),

                  GestureDetector(
                    onTap: () {
                        context.read<SelectDetailGoal>().selectDetailGoal('3');
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const DPcreateInput2Page(),)
                          );
                      },
                    child: SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[3];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';

                        if (index == 4) {
                            return Container(
                              color: const Color(0xff929292),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['3'],
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {

                            return Container(
                              color: const Color(0xff5C5C5C),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                values.toString(),
                                style: const TextStyle(color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                      })
                    )
                  ),),


                  GestureDetector(
                    onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const DPcreateInput1Page(),)
                          );
                      }, 
                    child: SizedBox(
                      width: 100,
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(9, (index) {
                        
                          if (index == 4) {
                            return Container(
                              color: const Color(0xffFCFF62),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  context.watch<SelectFinalGoalModel>().selectedFinalGoal,
                                  style: const TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {
                            final inputtedDetailGoals = context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal;
                            final value = inputtedDetailGoals.containsKey(index.toString()) ? inputtedDetailGoals[index.toString()] : '';

                            return Container(
                              color: const Color(0xff929292),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                value,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                        }),
                      ),
                    ),),

                  

                  GestureDetector(
                    onTap: () {
                        context.read<SelectDetailGoal>().selectDetailGoal('5');
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const DPcreateInput2Page(),)
                          );
                      },
                    child: SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[5];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';

                        if (index == 4) {
                            return Container(
                              color: const Color(0xff929292),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['5'],
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {

                            return Container(
                              color: const Color(0xff5C5C5C),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                values.toString(),
                                style: const TextStyle(color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                      })
                    )
                  ),),

                  GestureDetector(
                    onTap: () {
                        context.read<SelectDetailGoal>().selectDetailGoal('6');
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const DPcreateInput2Page(),)
                          );
                      },
                    child: SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[6];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';

                        if (index == 4) {
                            return Container(
                              color: const Color(0xff929292),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['6'],
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {

                            return Container(
                              color: const Color(0xff5C5C5C),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                values.toString(),
                                style: const TextStyle(color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                      })
                    )
                  ),),

                  GestureDetector(
                    onTap: () {
                        context.read<SelectDetailGoal>().selectDetailGoal('7');
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const DPcreateInput2Page(),)
                          );
                      },
                    child: SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[7];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';

                        if (index == 4) {
                            return Container(
                              color: const Color(0xff929292),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['7'],
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {

                            return Container(
                              color: const Color(0xff5C5C5C),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                values.toString(),
                                style: const TextStyle(color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                      })
                    )
                  ),),

                  GestureDetector(
                    onTap: () {
                        context.read<SelectDetailGoal>().selectDetailGoal('8');
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const DPcreateInput2Page(),)
                          );
                      },
                    child: SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[8];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';

                        if (index == 4) {
                            return Container(
                              color: const Color(0xff929292),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['8'],
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {

                            return Container(
                              color: const Color(0xff5C5C5C),
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                values.toString(),
                                style: const TextStyle(color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                      })
                    )
                  ),),

                ],)
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
                  child: const Text('이전',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  ),
            
              ),

              TextButton(
                  onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const DPcreateConfirmPage(),)
                          );
                      }, 
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff131313),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)
                    )
                  ),
                  child: const Text('다음',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  ),
            
              )

              
            
          ],
        )
      )
      );
  }
}



