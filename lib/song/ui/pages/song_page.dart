import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/song/ui/pages/android/songs_page_android.dart';
import 'package:platform_design/song/ui/pages/ios/songs_page_ios.dart';
import 'package:platform_design/ui/icons/icons_android.dart';
import 'package:platform_design/ui/icons/icons_ios.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});
  static const String title = 'Settings';
  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const SongsPageAndroid(
            title: title, iconPage: IconsAndroid.songIcon);
      case TargetPlatform.iOS:
        return const SongsPageIos(
          title: title,
          iconPage: IconsIos.songIcon,
        );
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
