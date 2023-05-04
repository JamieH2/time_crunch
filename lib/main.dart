import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:time_crunch/task_hive.dart';
import 'hive_boxes.dart';
import 'dark_mode/theme.dart';
import 'dark_mode/theme_services.dart';
import 'settings.dart';
//imports for the screens files
import 'package:time_crunch/screens/home_page.dart';
import 'package:time_crunch/screens/meetings_page.dart';
import 'package:time_crunch/screens/email_page.dart';
import 'package:time_crunch/screens/news_page.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();   //HIVE SETUP
  Hive.registerAdapter(SettingsAdapter());  //this needs to be done with each adapter

  //final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  //Hive.init(appDocumentDir.path);   //related to the import that's greyed out ^

  /////   Elliot testing the crud stuff for boxes   /////

  late int userID;  //initialising one of the settings variables so i can take it out of the object
  await Hive.openBox<TodoTask>('task_hive');

  // Assign the Hive box to the global variable
  HiveBoxes.taskBox = Hive.box<TodoTask>('task_hive');
  Hive.registerAdapter(TodoTaskAdapter());
  Hive.registerAdapter(TimeOfDayAdapter());
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,

      home: navBar(),
    );
  }
}
//Sets up the widget
class navBar extends StatefulWidget {
  navBar({Key? key}) : super(key: key);

  @override
  _navBarState createState() =>
      _navBarState();
}
//Incoportates and displays the nav bar on page
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

// This allows user to use nav bar to switch screens, index being the one they have currently selected.
  bodySection() {
    switch (index){
      case 0:
        return HomePage();
      case 1 :
        return ToDoPage();
      case 2 :
        return EmailPage();
      case 3 :
        return NewsPage();
    }
  }

// This is the bottom navigation bar
// This creates a custom bottom navigation bar in the app
  customBottomNavBar() {
    return BottomNavyBar(
      selectedIndex: index,
      //The `index` variable is used to indicate the currently selected tab.
      items: [ // The items is a list of widgets, which represent each screen in the navigation bar.
        // Each item has an `icon`, `title`, and `textAlign` property to structure the navigation bar.
        BottomNavyBarItem(icon: Icon(Icons.home_outlined),  title: Text('Home'), textAlign: TextAlign.center,),
        BottomNavyBarItem(icon: Icon(Icons.people), title: Text('Meetings'), textAlign: TextAlign.center),
        BottomNavyBarItem(icon: Icon(Icons.email_outlined), title: Text('Email'), textAlign: TextAlign.center,),
        BottomNavyBarItem(icon: Icon(Icons.newspaper_outlined), title: Text('News'), textAlign: TextAlign.center,),
      ],
      onItemSelected: (index) => setState(() => this.index = index),
    );
  }
}