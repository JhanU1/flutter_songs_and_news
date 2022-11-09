import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/settings/ui/pages/android/settings_page_android.dart';
import 'package:platform_design/settings/ui/pages/ios/settings_page_ios.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const SettingsPageAndroid();
      case TargetPlatform.iOS:
        return const SettingsPageIos();
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
