import 'package:sqflite/sqflite.dart';

import '../helpers/database-handler.dart';

class AppointmentBlock
{
  int id;
  final int startTime;
  final int endTime;
  final String title;
  final String disc;
  AppointmentBlock._(this.id, this.startTime, this.endTime, this.title, this.disc);

  static AppointmentBlock createNewAppointmentBlock(int startTime, int endTime, String title, String disc)
  {
    AppointmentBlock temp = AppointmentBlock._(null, startTime, endTime, title, disc);
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
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>
  {
    AppointmentTable.id: this.id,
    AppointmentTable.startTime: this.startTime,
    AppointmentTable.endTime: this.endTime,
    AppointmentTable.title: this.title,
    AppointmentTable.disc: this.disc,
  };
}
