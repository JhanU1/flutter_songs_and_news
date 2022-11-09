import 'package:flutter/material.dart';

import '../../../song/ui/pages/song_page.dart';

class HomePageAndroid extends StatelessWidget {
  const HomePageAndroid({super.key, required this.songsTabKey});
  final Key songsTabKey;
  @override
  Widget build(BuildContext context) {
    return SongPage(
      key: songsTabKey,
    );
  }
}
