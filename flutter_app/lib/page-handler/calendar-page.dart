import 'package:flutter/material.dart';
import 'package:flutter_app/data-class/appointment-block.dart';

import '../calendar-card.dart';
import '../data-class/date.dart';

import '../helpers/database-handler.dart';

class CalendarPage extends StatefulWidget
{
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
{
  List<Date> dates = List<Date>();
  List<AppointmentBlock> appointments = List<AppointmentBlock>();
  static bool dataLoaded = false;

  initState()
  {
    super.initState();
    for(int i = 0; i < 365; i++)
    {
      dates.add(new Date(DateTime.now()));
    }
    getAppointments();
  }

  //Loads all the appointments from database.
  void getAppointments() async
  {
    appointments = await DBProvider.db.getAllAppointmentBlocks();
    for(int i = 0; i < dates.length; i++)
    {
      for(int j = 0; j < appointments.length; j++)
      {
        if(appointments[j].dateTime == dates[i].getDateString())
        {
          debugPrint("${dates[i].getDateString()} is equal to ${appointments[j].dateTime}");
          dates[i].appointments.add(appointments[j]);
        }
      }
    }
    dataLoaded = true;
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
