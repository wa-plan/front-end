import 'package:flutter/material.dart';
import 'package:dominoplan/pages/DPlistPage.dart';
import 'package:provider/provider.dart';
import 'package:dominoplan/model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => SelectFinalGoalModel(),),
        ChangeNotifierProvider(create: (_) => SaveInputtedDetailGoalModel(),),
        ChangeNotifierProvider(create: (_) => SaveInputtedActionPlanModel(),),
        ChangeNotifierProvider(create: (_) => SelectDetailGoal(),),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DPlistPage(),
      ),
      );
  }
}
