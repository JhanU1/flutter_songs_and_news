import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/user/ui/pages/android/sing_in_page_android.dart';

import 'ios/sign_in_page_ios.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const SignInPageAndroid();
      case TargetPlatform.iOS:
        return const SignInPageIos();
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
