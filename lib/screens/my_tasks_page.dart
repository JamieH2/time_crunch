import 'package:intl/intl.dart';
import '../screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_crunch/task_hive.dart';
import 'package:time_crunch/hive_boxes.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}
// creating the overall page layout
class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Time Crunch"),
          ],
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
      body: ValueListenableBuilder(
        // listen to the database
        valueListenable: HiveBoxes.taskBox.listenable(),
        builder: (context, Box<TodoTask> box, _) {
          if (box.isEmpty) {
            return Center(
              child: Text("No tasks found"),
            );
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final task = box.getAt(index)!;
              // delete the task
              return Dismissible(
                key: Key(task.key.toString()),
                direction: DismissDirection.endToStart,
                confirmDismiss: (_) async {
                  return await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Delete task"),
                        content: Text("Are you sure you want to delete this task?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text("Delete"),
                          ),
                        ],
                      );
                    },
                  );
                },
                onDismissed: (_) {
                  box.deleteAt(index);
                },
                background: Container(
                  color: Colors.red,
                  child: Icon(Icons.delete, color: Colors.white),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 16),
                ),
                child: ListTile(
                  title: Text(task.title,
                      style: TextStyle(fontSize: 15)),
                  subtitle: Text(task.note),
                  // Displaying the tasks
                  trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      Text(
                      DateFormat.yMd().format(task.date),
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  '${task.startTime.format(context)} - ${task.endTime.format(context)}',
                  style: TextStyle(fontSize: 12),
                ),
                ],
              ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}