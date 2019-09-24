import 'package:flutter/material.dart';

import 'card-helper.dart';
import 'page-handler/date-page.dart';
import 'data-class/date.dart';

class CalendarCard extends SmallCard
{
  final Date _date;

  CalendarCard(int index, this._date)
  {
    _date.getDateTime(index);
    leadingElement = FlutterLogo();
    titleElement = Text(_date.getDateString());
    pageRoute = MaterialPageRoute(builder: (context) => DatePage(_date));
  }
}
