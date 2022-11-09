import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/song/ui/pages/android/song_details_page_android.dart';
import 'package:platform_design/song/ui/pages/ios/song_details_page_ios.dart';

import '../../model/song_model.dart';

class SongDetailspage extends StatelessWidget {
  SongDetailspage({super.key, required this.songModel});
  Song songModel;
  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return SongDetailsPageAndroid(songModel: songModel);
      case TargetPlatform.iOS:
        return SongDetailsPageIos(songModel: songModel);
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
