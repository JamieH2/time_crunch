import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_crunch/screens/tutorial_page.dart';
import '../dark_mode/theme_services.dart';

void main() => runApp(const SettingsPage());

//the settings page give the a couple of options of functionality, however we couldn't complete as much functionality as we wanted so it's a little bare.
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //this appbar has our logo on the left the company name center and the settings button right
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(15),
            textStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ThemeService().switchTheme();
                },
                child: const Text("Dark Mode"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  Get.to(TutorialPage());
                },
                child: const Text("Video tutorial"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}