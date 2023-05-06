import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_crunch/screens/tutorial_page.dart';
import '../dark_mode/theme.dart';
import '../task booking/add_task_bar.dart';
import '../screens/my_tasks_page.dart';
import 'settings_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_crunch/task_hive.dart';
import 'package:time_crunch/hive_boxes.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    Hive.initFlutter();
  }

  void deleteTask(TodoTask task) {
    task.delete();
  }

  @override
  Widget build(BuildContext context) {
    final tasks = HiveBoxes.taskBox.values.toList();
    return Scaffold(
      appBar: AppBar(
        //this appbar has our logo on the left the company name center and the settings button right
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Time Crunch"),
          ],
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Container(
            width: 50,
            height: 50,
            child: Image.asset('assets/time_crunch_logo.png'),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.settings, size: 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            //this adds a header of today's date and the word today
            margin: const EdgeInsets.only(left: 5, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: subHeadingStyle,
                      ),
                      Text(
                        "Today",
                        style: headingStyle,
                      ),
                    ],
                  ),
                ),
                Row(
                  //this adds two buttons next to each other allowing the user to view and add tasks
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(const AddTaskPage());
                      },
                      child: const Text("Add task"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(const TaskListPage());
                      },
                      child: const Text("My Tasks"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            //this is the calendar i have used i've changed the attributes so it fills the available space
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                headerVisible: false,
                shouldFillViewport: true,
              ),
            ),
          ),
          SingleChildScrollView(
            //this allows the user to click a button to watch a tutorial
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Click the button to watch a tutorial!",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(TutorialPage());
                    },
                    child: const Text("Watch a tutorial"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
