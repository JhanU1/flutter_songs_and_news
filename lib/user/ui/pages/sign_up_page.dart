import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'android/sign_up_page_android.dart';
import 'ios/sing_up_page_ios.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const SignUpPageAndroid();
      case TargetPlatform.iOS:
        return const SignUpPageIos();
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
