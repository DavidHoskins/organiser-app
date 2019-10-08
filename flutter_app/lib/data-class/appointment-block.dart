import 'package:sqflite/sqflite.dart';

import '../helpers/database-handler.dart';

class AppointmentBlock
{
  int id;
  final int startTime;
  final int endTime;
  final String title;
  final String disc;
  final String dateTime;
  AppointmentBlock._(this.id, this.startTime, this.endTime, this.title, this.disc, this.dateTime);

  static AppointmentBlock createNewAppointmentBlock(int startTime, int endTime, String title, String disc, String dateTime)
  {
    AppointmentBlock temp = AppointmentBlock._(null, startTime, endTime, title, disc, dateTime);
    DBProvider.db.addAppointmentBlockToDB(temp);
    return temp;
  }

    factory AppointmentBlock.fromJson(Map<String, dynamic> data)
  {
    return AppointmentBlock._
      (
      data[AppointmentTable.id] as int,
      data[AppointmentTable.startTime] as int,
      data[AppointmentTable.endTime] as int,
      data[AppointmentTable.title] as String,
      data[AppointmentTable.disc] as String,
      data[AppointmentTable.dateTime] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>
  {
    AppointmentTable.startTime: this.startTime,
    AppointmentTable.endTime: this.endTime,
    AppointmentTable.title: this.title,
    AppointmentTable.disc: this.disc,
    AppointmentTable.dateTime: this.dateTime
  };
}
