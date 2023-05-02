// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'settings_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

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
      body: Column(
          children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Scroll for more news providers'),
    ),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
    padding: const EdgeInsets.only(left: 16.0, top: 45),
    child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    const url = 'https://www.bbc.co.uk/news/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                        'assets/bbc logo.png', width: 180, height: 180),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = 'https://www.channel4.com/news/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset(
                        'assets/channel 4 news logo.png', width: 180, height: 180),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    const url = 'https://www.dailymail.co.uk/home/index.html';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                        'assets/daily mail logo.png', width: 180, height: 180),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = 'https://www.theguardian.com/uk';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset(
                        'assets/guardian news.png', width: 180, height: 180),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    const url = 'https://www.independent.co.uk/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                        'assets/Independent news logo.png', width: 180, height: 180),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = 'https://news.sky.com/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset(
                        'assets/sky news logo.png', width: 180, height: 180),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    const url = 'https://www.thetimes.co.uk/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                        'assets/the times logo.png', width: 180, height: 180),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = 'https://www.ft.com/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset(
                        'assets/financial times logo.png', width: 180, height: 180),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    const url = 'https://www.telegraph.co.uk/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                        'assets/daily telegraph logo.png', width: 180, height: 180),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = 'https://www.itv.com/news';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset(
                        'assets/itv news logo.png', width: 180, height: 180),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    const url = 'https://www.express.co.uk/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                        'assets/daily express logo.png', width: 180, height: 180),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = 'https://www.mirror.co.uk/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset(
                        'assets/daily mirror logo.png', width: 180, height: 180),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    ]));
  }
}
