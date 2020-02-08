import 'package:intl/intl.dart';

class AutoDateListing {
  List<DateTime> list(DateTime date) {

    DateFormat f = DateFormat('EEEE');
    List<DateTime> addToList(int start, int end) {
      List<DateTime> list = [];
      for (int i = start; i <= end; i++)
        list.add(DateTime.now().add(Duration(days: i)));
      return list;
    }

    switch(f.format(date)) {
      case 'Sunday':
        return addToList(1, 5);
      case 'Monday':
        return addToList(0, 4);
      case 'Tuesday':
        return addToList(-1, 3);
      case 'Wednesday':
        return addToList(-2, 2);
      case 'Friday':
        return addToList(-3, 1);
      case 'Saturday':
        return addToList(2, 6);
      default:
        return [DateTime.now()];
    }
  }
}