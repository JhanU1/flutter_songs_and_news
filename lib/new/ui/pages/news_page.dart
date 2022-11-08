import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'android/news_page_android.dart';
import 'ios/news_page_ios.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const NewsPageAndroid();
      case TargetPlatform.iOS:
        return const NewsPageIos();
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
