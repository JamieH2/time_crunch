import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:path_provider/path_provider.dart' as path_provider;   //pretty sure we don't need this but i'll keep it
import 'settings.dart';

//imports for the screens files Elliot's moving over from that github tutorial
import 'package:time_crunch/screens/home_page.dart';
import 'package:time_crunch/screens/todo_page.dart';
import 'package:time_crunch/screens/email_page.dart';
import 'package:time_crunch/screens/meeting_page.dart';
import 'package:time_crunch/screens/news_page.dart';
import 'package:time_crunch/screens/tutorial_page.dart';
import 'package:time_crunch/screens/settings_page.dart';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();   //HIVE SETUP
  Hive.registerAdapter(SettingsAdapter());  //this needs to be done with each adapter

  //final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  //Hive.init(appDocumentDir.path);   //related to the import that's greyed out ^

  /////   Elliot testing the crud stuff for boxes   /////

  late int userID;  //initialising one of the settings variables so i can take it out of the object

  final settingsBox = await Hive.openBox('settings');
  //that line should create the box for us to then open however many times later
  //final settingsBox = Hive.box('settings');  this is the line we use later instead of opening it again
  //yknow like in a different class further down like within a widget
  settingsBox.put('0', 0667); //the key can also be a string, so for userID could be like EllCamacho etc
                              //this ONLY puts the number 0667 into the entry for key 0

  Settings settingsProfile1 = Settings(
      settingsProfile: 1,
      userID: 0667,
      language: 'English',
      colourblind: 'None',         //This is what making an object to then put in
      audio: false,                //the box looks like
      notifications: true);

  settingsBox.put('1', settingsProfile1);

  final something = settingsBox.get('0');
  print(something); //this just prints 0667 that we just added to the settings box
  final somethingElse = settingsBox.get('1');
  print(somethingElse); //this isn't gonna print much bcus it's an object and we don't have like a repr function
                        //defined or anything
  Settings thisOne = settingsBox.get('1');
  userID = thisOne.userID;
  print(userID);  //so this looks kinda pointless but it's me retrieving specifically a variable from within the box
                  //bcus as seen with the above lines you can't just print the whole thing like a list
  //


  ///// end of Elliot demo-ing crud stuff //////

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: navBar(),
    );
  }
}

class navBar extends StatefulWidget {
  navBar({Key? key}) : super(key: key);

  @override
  _navBarState createState() =>
      _navBarState();
}


class _navBarState
    extends State<navBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodySection(),
      bottomNavigationBar: customBottomNavBar(),
    );
  }

// * Body Section Components
  bodySection() {
    switch (index){
      case 0:
        return HomePage();
      case 1 :
        return ToDoPage();
      case 2 :
        return EmailPage();
      case 3:
        return MeetingPage();


    }
  }

// * BottomNavigationBar Section Components
  customBottomNavBar() {
    return BottomNavyBar(  //bottom navy bar can't change name because it's an import
      selectedIndex: index,
      backgroundColor: Colors.blue,
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text('Home'),
          activeColor: Colors.white,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.check_circle_outline_rounded),
            title: Text('ToDo'),
            activeColor: Colors.white,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
          icon: Icon(Icons.email_outlined),
          title: Text('Email'),
          activeColor: Colors.white,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text('Meeting'),
          activeColor: Colors.white,
          textAlign: TextAlign.center,
        ),
        //

      ],
      onItemSelected: (index) => setState(() => this.index = index),
    );
  }
}
