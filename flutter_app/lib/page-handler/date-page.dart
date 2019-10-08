import 'package:flutter/material.dart';
import 'package:flutter_app/data-class/appointment-block.dart';

import '../data-class/date.dart';

class DatePage extends StatefulWidget
{
  Date _date;
  DatePage(this._date);
  _DatePageState createState() => _DatePageState(_date);
}

class _DatePageState extends State<DatePage>
{
  Date _date;
  _DatePageState(this._date);

  static const Color primaryColor = Colors.blueGrey;
  static const Color secondaryColor = Colors.grey;

  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text(_date.getDateString())),
      body: _getAppointmentTimetable(context),
      floatingActionButton:
      FloatingActionButton
      (
        child: Icon(Icons.add),
        onPressed: ()
        {
          setState(()
          {
            _date.appointments.add(AppointmentBlock.createNewAppointmentBlock(10, 11, "ADDED", "STUFF"));
          });
        }
      ),
    );
  }

    Widget _getAppointmentTimetable(BuildContext context)
  {
    return ListView.builder
    (
        itemCount: _date.appointments.length,
        itemBuilder: (context, index) {
          if(index % 2 == 0)
            return CurvedListItem
            (
              title: _date.appointments[index].title,
              time: "${_date.appointments[index].startTime.toString()} - ${_date.appointments[index].endTime.toString()}",
              color: secondaryColor,
              nextColor: index == 3? secondaryColor : primaryColor,
            );
          else
            return CurvedListItem
            (
              title: _date.appointments[index].title,
              time: "${_date.appointments[index].startTime.toString()} - ${_date.appointments[index].endTime.toString()}",
              color: primaryColor,
              nextColor: index == 3? primaryColor : secondaryColor,
            );
      }
    );
  }
}

class CurvedListItem extends StatelessWidget {
  const CurvedListItem({
    this.title,
    this.time,
    this.icon,
    this.people,
    this.color,
    this.nextColor,
  });

  final String title;
  final String time;
  final String people;
  final IconData icon;
  final Color color;
  final Color nextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: nextColor,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80.0),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 32,
          top: 80.0,
          bottom: 50,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                time,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Row(),
            ]),
      ),
    );
  }
}
