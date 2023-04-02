// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'settings_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.settings, size: 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60, width: 2000,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    const url = 'https://zoom.us/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                        'assets/zoom logo.png', width: 180, height: 180),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = 'https://www.microsoft.com/en/microsoft-teams/log-in';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset(
                        'assets/teams logo.png', width: 180, height: 180),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
