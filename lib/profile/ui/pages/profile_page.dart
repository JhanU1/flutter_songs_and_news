import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/profile/ui/pages/android/profile_page_android.dart';
import 'package:platform_design/profile/ui/pages/ios/profile_page_ios.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const ProfilePageAndroid();
      case TargetPlatform.iOS:
        return const ProfilePageIos();
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
