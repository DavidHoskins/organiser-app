import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import '../data-class/appointment-block.dart';

//Class used to simplify getting data from db.
abstract class AppointmentTable
{
  static const fileName = "appointment-directory.db";

  static const tableName = "Appointments";

  static const id = "id";
  static const startTime = "startTime";
  static const endTime = "endTime";
  static const title = "title";
  static const disc = "disc";
  static const dateTime = "dateTime";
}

class DBProvider
{
  DBProvider._();

  static DBProvider db = DBProvider._();

  Database _database;

    Future<Database> get database async
  {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

    initDB() async
  {
    String path = join(await getDatabasesPath(), AppointmentTable.fileName);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async
        {
          await db.execute("CREATE TABLE ${AppointmentTable.tableName} ("
              "${AppointmentTable.id} INTEGER PRIMARY KEY,"
              "${AppointmentTable.startTime} INTEGER,"
              "${AppointmentTable.endTime} INTEGER,"
              "${AppointmentTable.title} STRING,"
              "${AppointmentTable.disc} STRING,"
              "${AppointmentTable.dateTime} INTEGER"
              ")"
          );
        });
  }

  //Adds the appointment block to the db for storage.
  void addAppointmentBlockToDB(AppointmentBlock _appointmentBlock) async
  {
    final db = await database;
    var temp = _appointmentBlock.toJson();
    List<Map<String, dynamic>> checkFirst = await db.rawQuery("SELECT COUNT(*) FROM ${AppointmentTable.tableName} WHERE ${AppointmentTable.id} = '${_appointmentBlock.id}'");
    var raw;
    if(checkFirst[0]["COUNT(*)"] > 0)
    {
      raw = await db.update
        (
          AppointmentTable.tableName,
          temp,
          where: '${AppointmentTable.id} = ?',
          whereArgs: [_appointmentBlock.id]
      );
    }
    else
    {
      raw = await db.insert
        (
        AppointmentTable.tableName,
        temp,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return raw;
  }

  //Gets all the appointments returned from the database.
  Future<List<AppointmentBlock>> getAllAppointmentBlocks() async
  {
    final db = await database;
    var response = await db.query(AppointmentTable.tableName);
    List<AppointmentBlock> appointments = List<AppointmentBlock>();
    if(response.isNotEmpty)
    {
      for(int i = 0; i < response.length; i++)
      {
        appointments.add(AppointmentBlock.fromJson(response[i]));
      }
    }
    return appointments;
  }

  //Deletes an appointment from ID
  Future<int> deleteAppointmentWithID(var id) async
  {
    final db = await database;
    return db.delete(AppointmentTable.tableName, where: "${AppointmentTable.id} = ?", whereArgs: [id]);
  }

    //Deletes an appointment from Date which has been converted to an int.
  Future<int> deleteAppointmentWithDateAsInt(var date) async
  {
    final db = await database;
    return db.delete(AppointmentTable.tableName, where: "${AppointmentTable.dateTime} = ?", whereArgs: [date]);
  }
}
