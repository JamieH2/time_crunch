import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive Flutter package



part 'task_hive.g.dart';

@HiveType(typeId: 20)   //these numbers may have to be unique
class TodoTask extends HiveObject {

  @HiveField(0)
  late String title;

  @HiveField(1)
  late String note;

  @HiveField(2)
  late DateTime date;

  @HiveField(3)
  late TimeOfDay startTime;

  @HiveField(4)
  late TimeOfDay endTime;

}