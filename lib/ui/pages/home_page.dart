import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:platform_design/ui/pages/android/home_page_android.dart';

import 'ios/home_page_ios.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final songsTabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return HomePageAndroid(songsTabKey: songsTabKey);
      case TargetPlatform.iOS:
        return HomePageIos(songsTabKey: songsTabKey);
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
