import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../services/notification_services.dart';
import '../services/theme_services.dart';

void main() => runApp(const SettingsPage());

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{

  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.requestIOSPermissions();
    notifyHelper.initializeNotification();
  }

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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  ThemeService().switchTheme();
                  notifyHelper.displayNotification(title: "Theme Changed", body: Get.isDarkMode?"Activated Dark Them":"Activated light theme");
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
