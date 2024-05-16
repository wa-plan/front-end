import 'package:dominoplan/pages/DPcreate99Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:dominoplan/model.dart';

class DPcreateSelectPage extends StatelessWidget {
  const DPcreateSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            const Text(
              "어떤 목표를 이루고 싶나요?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.1
              )
            ),

            const SizedBox(
              height:20
            ),


            Container(
              height: 43,
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                color: const Color(0xff5C5C5C),
              ),
              ),
              child: const MyDropdownButton(),
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
                        return Container(
                          color: index == 4 ? const Color(0xff929292) : const Color(0xff5C5C5C),
                          margin: const EdgeInsets.all(1.0),
                         
                        );
                      })
                    )
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {
                        return Container(
                          color: index == 4 ? const Color(0xff929292) : const Color(0xff5C5C5C),
                          margin: const EdgeInsets.all(1.0),
                          
                        );
                      })
                    )
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {
                        return Container(
                          color: index == 4 ? const Color(0xff929292) : const Color(0xff5C5C5C),
                          margin: const EdgeInsets.all(1.0),
                          
                        );
                      })
                    )
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {
                        return Container(
                          color: index == 4 ? const Color(0xff929292) : const Color(0xff5C5C5C),
                          margin: const EdgeInsets.all(1.0),
                          
                        );
                      })
                    )
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {
                        return Container(
                          alignment: Alignment.center,
                          color: index == 4 ? const Color(0xffFCFF62) : const Color(0xff929292),
                          margin: const EdgeInsets.all(1.0),
                          child: 
                          index == 4 ? 
                          Consumer<SelectFinalGoalModel>(builder:(_, selectedFinalGoal, __) 
                            => Text(
                              selectedFinalGoal.selectedFinalGoal, 
                              style: const TextStyle(color:Colors.black, fontSize: 8, fontWeight:FontWeight.bold),
                              textAlign: TextAlign.center,)) 
                              : const Text(""),
                        );
                      })
                    )
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {
                        return Container(
                          color: index == 4 ? const Color(0xff929292) : const Color(0xff5C5C5C),
                          margin: const EdgeInsets.all(1.0),
                          
                        );
                      })
                    )
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {
                        return Container(
                          color: index == 4 ? const Color(0xff929292) : const Color(0xff5C5C5C),
                          margin: const EdgeInsets.all(1.0),
                          
                        );
                      })
                    )
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {
                        return Container(
                          color: index == 4 ? const Color(0xff929292) : const Color(0xff5C5C5C),
                          margin: const EdgeInsets.all(1.0),
                          
                        );
                      })
                    )
                  ),

                  SizedBox(
                    width: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {
                        return Container(
                          color: index == 4 ? const Color(0xff929292) : const Color(0xff5C5C5C),
                          margin: const EdgeInsets.all(1.0),
                          
                        );
                      })
                    )
                  ),


                ],)
            ),

               TextButton(
                  onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const DPcreate99Page(),)
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







const List<String> list = <String>["선택 안됨", "환상적인 세계여행", "행복한 2024년"];  //일단은 여기에 리스트 만들어서 state 관리하고 있지만, 서버 연결되면 리스트 안만들고 바로 데이터 불러올 예정.

class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({super.key});

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton>{

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context){
    return(
      DropdownButton<String>(
        value:dropdownValue,
        onChanged: (String? value){
          context.read<SelectFinalGoalModel>().selectFinalGoal(value!);
          setState(() {
            dropdownValue = value;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        
        isExpanded: true,
        elevation: 1,
        dropdownColor: const Color(0xff262626),
        underline: Container(),
        icon: const Icon(Icons.arrow_drop_down),
        iconEnabledColor: Colors.white,
        style: const TextStyle(
          color: Colors.white,
        ),
      )
    );
  }
}