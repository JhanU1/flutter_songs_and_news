import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/song/ui/pages/android/songs_page_android.dart';
import 'package:platform_design/song/ui/pages/ios/songs_page_ios.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const SongsPageAndroid();
      case TargetPlatform.iOS:
        return const SongsPageIos();
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
