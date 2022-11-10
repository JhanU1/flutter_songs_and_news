import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'android/loading_page_android.dart';
import 'ios/loading_page_ios.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});
  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const LoadingPageAndroid();
      case TargetPlatform.iOS:
        return const LoadingPageIos();
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
