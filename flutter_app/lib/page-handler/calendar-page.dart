import 'package:flutter/material.dart';

import '../calendar-card.dart';
import '../data-class/date.dart';

class CalendarPage extends StatefulWidget
{
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
{
  List<Date> dates = List<Date>();

  _CalendarPageState()
  {
    for(int i = 0; i < 365; i++)
    {
      dates.add(new Date(DateTime.now()));
    }
  }

  Widget build(BuildContext context)
  {
    return ListView.builder(
      itemCount: dates.length,
      itemBuilder: (context, index)
      {
        return CalendarCard(index, dates[index]);
      }
    );
  }
}
