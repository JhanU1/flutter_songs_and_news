import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/ui/widgets/logout_button/android/logout_button_android.dart';

import 'ios/logout_button_ios.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const LogOutButtonAndroid();
      case TargetPlatform.iOS:
        return const LogOutButtonIos();
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
