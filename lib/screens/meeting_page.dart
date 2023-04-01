import 'package:flutter/material.dart';
import 'package:time_crunch/screens/settings_page.dart';

import '../services/theme_services.dart';

//void main() => runApp(const SettingsPage());

class MeetingPage extends StatelessWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  ThemeService().switchTheme();
                },
                child: const Icon(Icons.nightlight_round, size: 50),
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                          ListTile(title: Text('Item #$index')),
                      childCount: 1000,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
