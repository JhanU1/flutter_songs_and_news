import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/settings/ui/pages/android/settings_page_android.dart';
import 'package:platform_design/settings/ui/pages/ios/settings_page_ios.dart';
import 'package:platform_design/ui/icons/icons_android.dart';
import 'package:platform_design/ui/icons/icons_ios.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const String title = 'Settings';
  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const SettingsPageAndroid(
          title: title,
          iconPage: IconsAndroid.settingsIcon,
        );
      case TargetPlatform.iOS:
        return const SettingsPageIos(
          title: title,
          iconPage: IconsIos.settingsIcon,
        );
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
