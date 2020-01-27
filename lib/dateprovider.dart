import 'package:flutter/material.dart';

class DateSelector with ChangeNotifier {
  DateTime _selected = DateTime.now();
  DateTime get selectedDate => _selected;

  void setDate(DateTime date) {
    _selected = date;
    notifyListeners();
  }
}