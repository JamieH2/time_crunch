import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:path_provider/path_provider.dart' as path_provider;   //pretty sure we don't need this but i'll keep it
import 'settings.dart';

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
  const MyApp({super.key});
    // Hello- Test
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Time crunch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
