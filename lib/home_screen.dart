import 'package:flutter/material.dart';
import 'package:module_eleven/video_player_view_container.dart';

import 'map_view_container.dart';
import 'my_web_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Open Webpage"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                      title: "Marvel",
                      selectedUrl:
                          "https://developer.marvel.com/documentation/images",
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Go to map"),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MapViewContainer(),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text("Go to video"),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const VideoPlayerViewContainer(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
