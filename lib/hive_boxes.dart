import 'package:hive/hive.dart';
import 'package:time_crunch/task_hive.dart';

//global variable to easily reference box functions throughout the code
class HiveBoxes {
  static Box<TodoTask> taskBox = Hive.box<TodoTask>('task_hive');
}