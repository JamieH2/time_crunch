import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test Demo',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Time Crunch Calendar application'),
    );
  }
}

class MyHomePage extends StatelessWidget {
 const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // implement settings....
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Calendar goes here',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                DrawerHeader(
                child: Image.asset(
                    "assets/images/Blue.png",
                    height: 10,
                    width: 10,
                      ),
                    )
                ],
            ),

            ListTile(
              title: Text('Todo list(NEED TO IMPLEMENT)'),
              onTap: () {
                // implement to-do list
              },
            ),
            ListTile(
              title: Text('Event(NEED TO IMPLEMENT)'),
              onTap: () {
                // Implement events
              },
            ),
          ],
        ),
      ),
    );
  }
}
