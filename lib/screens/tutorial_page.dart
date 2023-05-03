import 'package:flutter/material.dart';
import 'package:time_crunch/screens/settings_page.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const TutorialPage());

/// Stateful widget to fetch and then display video content.
class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<TutorialPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/orange.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          //this appbar has a back button on the left the company name center and the settings button right
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: const Text("Tutorial"),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
        // this is the code for tutorial video in a center widget
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: VideoPlayer(_controller),
            ),
          )
              : Container(),
        ),
        // this is the play button for the video
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
