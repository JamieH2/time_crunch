import 'settings_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final controllerTo = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Time Crunch"),
          ],
        ),
        leading: Row(
          children: [
            Container(
              width: 40,
              child: Image.asset('assets/time_crunch_logo.png'),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
              // Handle the button press event
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField(title: 'To', controller: controllerTo),
            const SizedBox(height: 16),
            buildTextField(title: 'Subject', controller: controllerSubject),
            const SizedBox(height: 16),
            buildTextField(
              title: 'Message',
              controller: controllerMessage,
              maxLines: 8,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text ('SEND'),
              onPressed: () => launchEmail(
                toEmail: controllerTo.text,
                subject: controllerSubject.text,
                message: controllerMessage.text,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    const url = 'https://mail.google.com';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Image.asset('assets/gmail.png', width: 80, height: 80),
                ),
                InkWell(
                  onTap: () async {
                    const url = 'https://www.outlook.com';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Image.asset('assets/outlook.png', width: 80, height: 80),
                ),
                InkWell(
                  onTap: () async {
                    const url = 'https://mail.yahoo.com';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Image.asset('assets/yahoo.png', width: 80, height: 80),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future launchEmail({
    required String toEmail,
    required String subject,
    required String message,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Widget buildTextField({
    required String title,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
