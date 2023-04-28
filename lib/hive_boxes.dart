import 'package:hive/hive.dart';
import 'package:time_crunch/task_hive.dart';

class HiveBoxes {
  static Box<TodoTask> taskBox = Hive.box<TodoTask>('task_hive');
}