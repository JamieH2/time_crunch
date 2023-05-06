import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../screens/settings_page.dart';
import 'input_field.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_crunch/task_hive.dart';
import 'package:time_crunch/hive_boxes.dart';
import '../screens/my_tasks_page.dart';



class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  late DateTime _selectedDate = DateTime.now();
  late TimeOfDay _startTime = TimeOfDay(hour: 9, minute: 30);
  late TimeOfDay _endTime = TimeOfDay(hour: 10, minute: 30);
  late String _title = "";
  late String _note = "";

  //@override
  //void initState() {
    //super.initState();
    //Hive.openBox<TodoTask>('task_hive');}

    // Create a function to get the date from the user
    Future<void> _getDateFromUser() async {
      DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365 * 5)),
        lastDate: DateTime.now().add(Duration(days: 365 * 5)),
      );
      if (_pickerDate != null) {
        setState(() {
          _selectedDate = _pickerDate;
        });
        print(_selectedDate.toString());
      }
    }

    // Create a function to get the time from the user
    Future<void> _getTimeFromUser({required bool isStartTime}) async {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: isStartTime ? _startTime : _endTime,
      );
      if (pickedTime != null) {
        setState(() {
          if (isStartTime) {
            _startTime = pickedTime;
          } else {
            _endTime = pickedTime;
          }
        });
      } else {
        print('Time cancelled');
      }
    }

    // Add the task by storing these variables in the database
    Future<void> _addTask(String title, String note, DateTime date, TimeOfDay startTime, TimeOfDay endTime) async {
      final newTask = TodoTask()
          ..title = _title
          ..note = _note
          ..date = _selectedDate
          ..startTime = _startTime
          ..endTime = _endTime;

      HiveBoxes.taskBox.add(newTask);
      Get.to(TaskListPage());
      setState(() {});
      print("Title: $title");
      print("Note: $note");
      print("Date: $date");
      print("Start Time: $startTime");
      print("End Time: $endTime");
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          //this appbar has a back button on the left the company name center and the settings button right
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Time Crunch"),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
        body: Padding(
          // so the code in the body creates the input fields it also uses decoration to fade out the input form hints
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add Task",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  onChanged: (value) => setState(() => _title = value),
                  decoration: InputDecoration(labelText: 'Enter a title'),
                ),
                TextField(
                  onChanged: (value) => setState(() => _note = value),
                  decoration: InputDecoration(labelText: 'Note'),
                ),
                MyInputField(
                  title: "Date",
                  hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_outlined),
                    color: Colors.grey,
                    onPressed: _getDateFromUser,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: MyInputField(
                            title: "Start Time",
                            hint: _startTime.format(context),
                            widget: IconButton(
                              onPressed: () {
                                _getTimeFromUser(isStartTime: true);
                              },
                              icon: Icon(
                                Icons.access_time_rounded,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: MyInputField(
                            title: "End Time",
                            hint: _endTime.format(context),
                            widget: IconButton(
                              onPressed: () {
                                _getTimeFromUser(isStartTime: false);
                              },
                              icon: Icon(
                                Icons.access_time_rounded,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          await _addTask(_title, _note, _selectedDate, _startTime, _endTime);
                        },
                        child: Text('Add Task'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
