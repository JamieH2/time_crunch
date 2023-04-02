import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../dark_mode/theme.dart';
import 'input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
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
              // Handle the button press event
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left:20, right:20),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Task",
                  style: headingStyle,
            ),
            MyInputField(title: "Title", hint: "Enter your title"),
            MyInputField(title: "Note", hint: "Enter your note"),
            MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate)),
          ],
        ),
      ),
      )
    );
  }
}
