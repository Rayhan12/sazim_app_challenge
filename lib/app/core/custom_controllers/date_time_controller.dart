import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DateTimeController extends ChangeNotifier {
  DateTime? dateTime;

  void inputDateTime(DateTime data) {
    dateTime = data;
    notifyListeners();
  }

  void clearDateTime() {
    dateTime = null;
    notifyListeners();
  }


  bool hasDate() {
    return dateTime != null;
  }

  String getDateMonthYear() {
    return DateFormat()
        .add_yMMMd()
        .format(dateTime!);
  }

  String getTime() {
    return DateFormat()
        .add_Hm()
        .format(dateTime!);
  }

  @override
  String toString() {
    return 'DateTimeController{dateTime: $dateTime}';
  }
}
