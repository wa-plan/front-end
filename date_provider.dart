import 'package:flutter/material.dart';
//import 'package:flutter_application_1/todayDomino/pages/add_page2.dart';
import 'package:flutter_application_1/todayDomino/widgets/add_calendar.dart';
import 'package:flutter_application_1/todayDomino/widgets/repeat_settings.dart';

class DateProvider extends ChangeNotifier {
  //DateTime _pickedDate = AddPage2State()._pickedDate;
  DateTime _pickedDate = DateTime.now();
  DateTime get pickedDate => _pickedDate;
  //bool switchValue = AddPage2State().switchValue;
  bool everyDay = RepeatSettingsState().everyDay;
  bool everyWeek = RepeatSettingsState().everyWeek;
  bool everyTwoWeek = RepeatSettingsState().everyTwoWeek;
  bool everyMonth = RepeatSettingsState().everyMonth;
  Map<DateTime, dynamic> repeatDates = {};

  pick() {
    _pickedDate = AddCalendarState().pickedDate;
    notifyListeners();
  }

  repeat() {
    if (everyDay) {
      repeatDates = {};
      for (int i = 0; i < 365; i++) {
        // 일단 1년치 데이터를 예제로 넣겠습니다.
        repeatDates[_pickedDate] = "반복 데이터"; // 원하는 데이터를 넣으시면 됩니다.
        _pickedDate = _pickedDate.add(const Duration(days: 1));
      }
    } else if (everyWeek) {
      repeatDates = {};
      for (int i = 0; i < 365; i++) {
        // 일단 1년치 데이터를 예제로 넣겠습니다.
        repeatDates[_pickedDate] = "반복 데이터"; // 원하는 데이터를 넣으시면 됩니다.
        _pickedDate = _pickedDate.add(const Duration(days: 7));
      }
    } else if (everyTwoWeek) {
      repeatDates = {};
      for (int i = 0; i < 365; i++) {
        // 일단 1년치 데이터를 예제로 넣겠습니다.
        repeatDates[_pickedDate] = "반복 데이터"; // 원하는 데이터를 넣으시면 됩니다.
        _pickedDate = _pickedDate.add(const Duration(days: 14));
      }
    } else if (everyMonth) {
      repeatDates = {};
      for (int i = 0; i < 365; i++) {
        // 일단 1년치 데이터를 예제로 넣겠습니다.
        repeatDates[_pickedDate] = "반복 데이터"; // 원하는 데이터를 넣으시면 됩니다.
        _pickedDate = _pickedDate.add(const Duration(days: 30));
      }
    }
  }

  int count = 0;

  add() {
    count++;
    notifyListeners();
  }

  remove() {
    count--;
    notifyListeners();
  }
}
