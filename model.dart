import 'package:flutter/material.dart';

class SelectFinalGoalModel with ChangeNotifier {
  String _selectedFinalGoal = "선택 안됨!.";
  String get selectedFinalGoal => _selectedFinalGoal;

  void selectFinalGoal(String value) {
    _selectedFinalGoal = value;
    notifyListeners();
  }
}

class SaveInputtedDetailGoalModel with ChangeNotifier {
  final Map  _inputtedDetailGoal = {
    '0':'',
    '1':'',
    '2':'',
    '3':'',
    '4':'',
    '5':'',
    '6':'',
    '7':'',
    '8':''
  };
  Map get inputtedDetailGoal => _inputtedDetailGoal;
}

class SaveInputtedActionPlanModel with ChangeNotifier {
  final List<Map> _inputtedActionPlan = [
    {
    '0':'',
    '1':'',
    '2':'',
    '3':'',
    '4':'',
    '5':'',
    '6':'',
    '7':'',
    '8':''
  },
  {
    '0':'',
    '1':'',
    '2':'',
    '3':'',
    '4':'',
    '5':'',
    '6':'',
    '7':'',
    '8':''
  },
  {
    '0':'',
    '1':'',
    '2':'',
    '3':'',
    '4':'',
    '5':'',
    '6':'',
    '7':'',
    '8':''
  },
  {
    '0':'',
    '1':'',
    '2':'',
    '3':'',
    '4':'',
    '5':'',
    '6':'',
    '7':'',
    '8':''
  },

  {
    '0':'',
    '1':'',
    '2':'',
    '3':'',
    '4':'',
    '5':'',
    '6':'',
    '7':'',
    '8':''
  },
  
  {
    '0':'',
    '1':'',
    '2':'',
    '3':'',
    '4':'',
    '5':'',
    '6':'',
    '7':'',
    '8':''
  },
  {
    '0':'',
    '1':'',
    '2':'',
    '3':'',
    '4':'',
    '5':'',
    '6':'',
    '7':'',
    '8':''
  },
  {
    '0':'',
    '1':'',
    '2':'',
    '3':'',
    '4':'',
    '5':'',
    '6':'',
    '7':'',
    '8':''
  },
  {
    '0':'',
    '1':'',
    '2':'',
    '3':'',
    '4':'',
    '5':'',
    '6':'',
    '7':'',
    '8':''
  },
  
 
  ];

  List<Map> get inputtedActionPlan => _inputtedActionPlan;
}

class SelectDetailGoal with ChangeNotifier {
  String _selectedDetailGoal = "";
  String get selectedDetailGoal => _selectedDetailGoal;

  void selectDetailGoal(String value) {
    _selectedDetailGoal = value;
    notifyListeners();
  }
}
