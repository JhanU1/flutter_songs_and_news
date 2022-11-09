import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/ui/icons/icons_android.dart';
import 'package:platform_design/ui/icons/icons_ios.dart';

import 'android/news_page_android.dart';
import 'ios/news_page_ios.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});
  static const String title = 'News';
  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const NewsPageAndroid(
          title: title,
          iconPage: IconsAndroid.newsIcon,
        );
      case TargetPlatform.iOS:
        return const NewsPageIos(
          title: title,
          iconPage: IconsIos.newsIcon,
        );
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
