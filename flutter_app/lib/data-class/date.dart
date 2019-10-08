

import 'package:flutter_app/data-class/appointment-block.dart';

class Date
{
  final DateTime _date;

  List<AppointmentBlock> appointments = List<AppointmentBlock>();

  Date(this._date);

  var _dateTime;

  final Map<int, String> months =
  {
    1 : "January", 2 : "February", 3 : "March", 4 : "April", 5 : "May",
    6 : "June", 7 : "July" , 8 : "August", 9 : "September", 10 : "October",
    11 : "November", 12 : "December",
  };

  final Map<int, String> days =
  {
    1 : "Monday", 2 : "Tuesday", 3 : "Wednesday", 4 : "Thursday",
    5 : "Friday", 6 : "Saturday", 7 : "Sunday"
  };

  String getDateString()
  {
    String stringToReturn = "${days[_dateTime.weekday]} ${_getCorrectExtension(_dateTime.day)} ${months[_dateTime.month]}";
    return stringToReturn;
  }

  String _getCorrectExtension(int value)
  {
    switch (value)
    {
      case 1:
        return "${_dateTime.day.toString()}st";
      case 2:
        return "${_dateTime.day.toString()}nd";
      case 3:
        return "${_dateTime.day.toString()}rd";
    }
    return "${_dateTime.day.toString()}th";
  }

  void updateDateTime(int index)
  {
    _dateTime = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + (index * 86400000));
  }
}
