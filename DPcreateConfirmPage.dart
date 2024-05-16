import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dominoplan/model.dart';

class DPcreateConfirmPage extends StatelessWidget {
  const DPcreateConfirmPage({super.key});

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

            const Text('작성한 내용을 확인해주세요.',
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

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[0];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';
                        final detailGoal = context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['0'];
                        final backgroundColor1 = detailGoal.isEmpty ? const Color(0xff262626) : const Color(0xff929292);

                        if (index == 4) {
                            return Container(
                              color: backgroundColor1,
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  detailGoal,
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {
                            final isValueEmpty = values.isEmpty;
                            final backgroundColor2 = isValueEmpty ? const Color(0xff262626) : const Color(0xff5C5C5C);

                            return Container(
                              color: backgroundColor2,
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
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[1];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';
                        final detailGoal = context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['1'];
                        final backgroundColor1 = detailGoal.isEmpty ? const Color(0xff262626) : const Color(0xff929292);

                        if (index == 4) {
                            return Container(
                              color: backgroundColor1,
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  detailGoal,
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {
                            final isValueEmpty = values.isEmpty;
                            final backgroundColor2 = isValueEmpty ? const Color(0xff262626) : const Color(0xff5C5C5C);

                            return Container(
                              color: backgroundColor2,
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
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[2];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';
                        final detailGoal = context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['2'];
                        final backgroundColor1 = detailGoal.isEmpty ? const Color(0xff262626) : const Color(0xff929292);

                        if (index == 4) {
                            return Container(
                              color: backgroundColor1,
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  detailGoal,
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {
                            final isValueEmpty = values.isEmpty;
                            final backgroundColor2 = isValueEmpty ? const Color(0xff262626) : const Color(0xff5C5C5C);

                            return Container(
                              color: backgroundColor2,
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
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[3];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';
                        final detailGoal = context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['3'];
                        final backgroundColor1 = detailGoal.isEmpty ? const Color(0xff262626) : const Color(0xff929292);

                        if (index == 4) {
                            return Container(
                              color: backgroundColor1,
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  detailGoal,
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {
                            final isValueEmpty = values.isEmpty;
                            final backgroundColor2 = isValueEmpty ? const Color(0xff262626) : const Color(0xff5C5C5C);

                            return Container(
                              color: backgroundColor2,
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
                  ),


                  SizedBox(
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
                            final values = inputtedDetailGoals.containsKey(index.toString()) ? inputtedDetailGoals[index.toString()] : '';
                            final isValueEmpty = values.isEmpty;
                            final backgroundColor2 = isValueEmpty ? const Color(0xff262626) : const Color(0xff929292);

                            return Container(
                              color: backgroundColor2,
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                values,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                        }),
                      ),
                    ),

                  

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[5];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';
                        final detailGoal = context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['5'];
                        final backgroundColor1 = detailGoal.isEmpty ? const Color(0xff262626) : const Color(0xff929292);

                        if (index == 4) {
                            return Container(
                              color: backgroundColor1,
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  detailGoal,
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {
                            final isValueEmpty = values.isEmpty;
                            final backgroundColor2 = isValueEmpty ? const Color(0xff262626) : const Color(0xff5C5C5C);

                            return Container(
                              color: backgroundColor2,
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
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[6];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';
                        final detailGoal = context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['6'];
                        final backgroundColor1 = detailGoal.isEmpty ? const Color(0xff262626) : const Color(0xff929292);

                        if (index == 4) {
                            return Container(
                              color: backgroundColor1,
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  detailGoal,
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {
                            final isValueEmpty = values.isEmpty;
                            final backgroundColor2 = isValueEmpty ? const Color(0xff262626) : const Color(0xff5C5C5C);

                            return Container(
                              color: backgroundColor2,
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
                  ),

                 SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[7];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';
                        final detailGoal = context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['7'];
                        final backgroundColor1 = detailGoal.isEmpty ? const Color(0xff262626) : const Color(0xff929292);

                        if (index == 4) {
                            return Container(
                              color: backgroundColor1,
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  detailGoal,
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {
                            final isValueEmpty = values.isEmpty;
                            final backgroundColor2 = isValueEmpty ? const Color(0xff262626) : const Color(0xff5C5C5C);

                            return Container(
                              color: backgroundColor2,
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
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {

                        final inputtedActionPlan = context.watch<SaveInputtedActionPlanModel>().inputtedActionPlan[8];
                        final values = inputtedActionPlan.containsKey(index.toString()) ? inputtedActionPlan[index.toString()] : '';
                        final detailGoal = context.watch<SaveInputtedDetailGoalModel>().inputtedDetailGoal['8'];
                        final backgroundColor1 = detailGoal.isEmpty ? const Color(0xff262626) : const Color(0xff929292);

                        if (index == 4) {
                            return Container(
                              color: backgroundColor1,
                              margin: const EdgeInsets.all(1.0),
                              child: Text(
                                  detailGoal,
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              
                            );
                          } else {
                            final isValueEmpty = values.isEmpty;
                            final backgroundColor2 = isValueEmpty ? const Color(0xff262626) : const Color(0xff5C5C5C);

                            return Container(
                              color: backgroundColor2,
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
                  ),

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

