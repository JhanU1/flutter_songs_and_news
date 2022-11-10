import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_design/new/ui/pages/ios/new_details_page_ios.dart';

import '../../model/new_model.dart';
import 'android/new_details_page_android.dart';

class NewDetailsPage extends StatelessWidget {
  const NewDetailsPage({super.key, required this.newModel});
  final New newModel;
  static const String title = "New Details";
  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return NewDetailsPageAndroid(
          newModel: newModel,
          titlePage: title,
        );
      case TargetPlatform.iOS:
        return NewDetailsPageIos(newModel: newModel);
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
