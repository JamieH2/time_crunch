import 'settings_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// email screen class, the email class allows the user to send a email from the app
// it uses a package called url_launcher to launch the devices email cient and input the message
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
      appBar: AppBar(
        //this appbar has our logo on the left the company name center and the settings button right
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
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
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.settings, size: 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ),
        ],
      ),

//this is the code for the input form which also uses controllers to save the input data
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField(title: 'To', controller: controllerTo),
            const SizedBox(height: 16),
            buildTextField(title: 'Subject', controller: controllerSubject),
            const SizedBox(height: 16),
            buildTextField(
              title: 'Message',
              controller: controllerMessage,
              maxLines: 4,
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
            //three buttons have been added to give the user the ability to login to their email accounts quickly
            SizedBox(height: 32),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Image.asset('assets/gmail.png', width: 80, height: 80),
                    ),
                  ),
                  SizedBox(width: 100), // add space between logos
                  InkWell(
                    onTap: () async {
                      const url = 'https://www.outlook.com';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Image.asset('assets/outlook.png', width: 80, height: 80),
                    ),
                  ),
                  const SizedBox(width: 100),
                  InkWell(
                    onTap: () async {
                      const url = 'https://mail.yahoo.com';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Image.asset('assets/yahoo.png', width: 80, height: 80),
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
// this defines the data that is used to write the email in the devices native email client
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
