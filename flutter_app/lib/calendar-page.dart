import 'package:flutter/material.dart';

import 'calendar-card.dart';

class CalendarPage extends StatefulWidget
{
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
{
  Widget build(BuildContext context)
  {
    return ListView.builder(
      itemCount: 365,
      itemBuilder: (context, index)
      {
        return CalendarCard(index);
      }
    );
  }
}
