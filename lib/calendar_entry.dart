//This is where we're gonna build the database
//Then it can be imported by the main and slotted into the front stuff.
//We've ditched the TimeUntilNotification entry for both this and the todo list
//Because that's not how that kind of feature work work

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

part 'navybar/calendar_entry.g.dart';

@HiveType(typeId: 0)   //these numbers may have to be unique
class CalendarEntry extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String location;

  @HiveField(2)
  String text;

  @HiveField(3)
  int entryID;

  @HiveField(4)
  int userID;

  CalendarEntry({required this.date, required this.location, required this.text, required this.entryID, required this.userID});
}