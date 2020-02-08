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
        List<DateTime> dates = addToList(-1, 3)
        ..removeAt(1)
        ..insert(0, DateTime.now());
        return dates;
      case 'Wednesday':
        List<DateTime> dates = addToList(-2, 2)
        ..removeAt(2)
        ..insert(0, DateTime.now());
        return dates;
      case 'Friday':
        List<DateTime> dates = addToList(-3, 1)
        ..removeAt(3)
        ..insert(0, DateTime.now());
        return dates;
      case 'Saturday':
        return addToList(2, 6);
      default:
        return [DateTime.now()];
    }
  }
}