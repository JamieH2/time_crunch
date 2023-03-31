import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

part 'todo_entry.g.dart';

@HiveType(typeId: 0)   //these numbers may have to be unique
class TodoEntry extends HiveObject {
  @HiveField(0)
  int todoID;

  @HiveField(1)
  int userID;

  @HiveField(2)
  String text;

  @HiveField(3)
  DateTime time;

  @HiveField(4)
  bool completed;

  TodoEntry({required this.todoID, required this.userID, required this.text, required this.time, required this.completed});
}