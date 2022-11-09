import 'package:flutter/material.dart';
import 'package:platform_design/song/ui/widgets/song_list_widget.dart';
import 'package:platform_design/ui/widgets/android_drawer.dart';
import 'package:platform_design/utils/utils.dart';

class SongsPageAndroid extends StatefulWidget {
  const SongsPageAndroid(
      {super.key, required this.title, required this.iconPage});

  final String title;
  final IconData iconPage;

  @override
  State<SongsPageAndroid> createState() => _SongsPageAndroidState();
}

class _SongsPageAndroidState extends State<SongsPageAndroid> {
  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.title),
            Icon(widget.iconPage),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async =>
                await _androidRefreshKey.currentState!.show(),
          ),
          const IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: togglePlatform,
          ),
        ],
      ),
      drawer: const AndroidDrawer(),
      body: RefreshIndicator(
          key: _androidRefreshKey,
          onRefresh: () {
            return runAfterDelay(function: () {
              setState(() {
                // Refresh the list
              });
            });
          },
          child: SongListWidget()),
    );
  }
}
