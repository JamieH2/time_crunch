//This is where we're gonna build the database
//Then it can be imported by the main and slotted into the front stuff.

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

part 'calendar_entry.g.dart';

@HiveType(typeId: 0)
class CalendarEntry extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String location;

  @HiveField(2)
  String text;

  CalendarEntry({required this.date, required this.location, required this.text});
}